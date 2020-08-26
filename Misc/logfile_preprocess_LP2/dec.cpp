/*
 *论文：Fast and efficient log file compression
 *说明：Transform variant 2
 *
 *Problem:
 *log lines may belong to more than one structural type.
 * As a result, similar lines are not always blocked, but they are intermixed with lines
 *differing in content or structure
 *Solution:
 *The second variant of the transform fixes this issue by using as a reference not a single
 *previous line, but a block of them(16 lines by default). For a new line, the block is searched
 *for the line that returns the longest initial match
 */
/*解码部分
 *解码过程是编码过程的逆过程
 *思路：
 *在编码的过程中，有一个参考的block表，根据该block表来进行编码
 *那么在解码的时候也要构造这样一个block表，来根据当前的一行日志记录的编码信息从
 *block表中找出对应的那一行，然后进行解码，将解码后的行写入新的文件中
 */
#include<stdio.h>
#include<stdlib.h>
#include<iostream>
#include<string>
#include<vector>
#include<time.h>
#include<string.h>

#define BLOCK_SIZE 16  //参考的block块的大小
#define LINE_SIZE 4096  

clock_t start, finish;  //用来计算程序执行时间
double duration;

char *file_in;
char *file_out;
FILE *fp_in, *fp_out;

char StrLine[LINE_SIZE]; //当前要处理的行
char FirstLine[LINE_SIZE]; //保存第一行记录
char AfterTrans[LINE_SIZE]; //保存每行转换后的字符串
char PreviousLine[LINE_SIZE]; //
char RefLine[LINE_SIZE];

int TotalLinesOfOpenFile = 0; //要处理文件的总行数
int CurrentLineNumber = 0; //当前要处理的line的编号  从0开始

int TransPos = 0; //用来将转换后的字符写入AfterTrans[]数组

int MaxMatchRefNumber = 0;

long long sum = 0;

//用循环数组来存储BLOCK
typedef struct
{
    char BlockLine[BLOCK_SIZE][LINE_SIZE]; //每次参考一个block
    int number[BLOCK_SIZE]; //对应的编号
    bool IsValid[BLOCK_SIZE]; //记录是否保存着有效的line
}Block;

Block block;

//解码当前的line
void DecCurrentLine();

//主要处理过程
void MainProcess();

//初始化block
void InitBlock();

//打开文件
int OpenFile();

//关闭文件
int CloseFile();


int main(int argc, char *argv[])
{
    start = clock();

    file_in = argv[1];
    file_out = argv[2];

    OpenFile();
    InitBlock();
    MainProcess();
    CloseFile();

    finish = clock();
    duration = (double)(finish - start) / CLOCKS_PER_SEC;

    printf("Elapsed time: %fseconds\n", duration);
    printf("Everything is Ok\n");
    return 0;
}

void DecCurrentLine()
{

}

//主要处理过程
void MainProcess()
{
    TotalLinesOfOpenFile = 0;

    //读取第一行
    fgets(FirstLine, LINE_SIZE, fp_in);
    TotalLinesOfOpenFile++;
    CurrentLineNumber = 0;

    fputs(FirstLine, fp_out); //将decode的结果写入out.txt文件，对于第一个line，就直接写入

    strcpy(PreviousLine, FirstLine);

    //int Count_Out = 0;
    while ((fgets(StrLine, LINE_SIZE, fp_in))!=NULL)
    {
        TotalLinesOfOpenFile++;

        CurrentLineNumber++;

        int StrPos = 0; //curse of StrLine
        int PrePos = 0; //curse of PreviousLine

        //读取当前line的第一个char
        MaxMatchRefNumber = (((int)StrLine[0]) & 0xFF) - 128;
        StrPos++;

        //从block中找出对应的匹配的line
        strcpy(PreviousLine, block.BlockLine[MaxMatchRefNumber]);


        TransPos = 0;
        int Match = 0;

        while (StrLine[StrPos] != '\0')
        {
            Match = 0;
            if (((((int)StrLine[StrPos]) & 0xFF) > 128) && ((((int)StrLine[StrPos]) & 0xFF)<255)) //有匹配 第一种匹配情况 匹配数 <127
            {


                if (((((int)StrLine[StrPos - 1]) & 0xFF) > 128) && ((((int)StrLine[StrPos - 1]) & 0xFF) < 255)&&((StrPos>1))) //前一个也是匹配的
                {//分析：出现这种情况是因为 在StrLine某个片段匹配完成后，恰好遇到了空格，这个时候，PreviousLine也是跳到了空格处，在
                    //在此匹配时就继续进行匹配，  所以就出现了两次介于 (128,255)之间的数了  
                    //解决的办法：首先把问题考虑清楚，我们要进行完成的还原，这第一个(128,255)之间的数还原完成后，这时候StrLine当前的
                    //下表指向空格，而PreviousLine的下表指向了一个非空格的字符，这时，我们要调到空格处，继续进行还原
                    while ((PreviousLine[PrePos] != ' ') && (PreviousLine[PrePos] != '\0'))
                    {
                        PrePos++;
                    }

                }

                Match = (((int)StrLine[StrPos]) & 0xFF) - 128;
                for (int k = 0;k < Match;k++)
                {
                    AfterTrans[TransPos++] = PreviousLine[PrePos++];
                }
                StrPos++;
            }
            else
            {
                if ((((int)StrLine[StrPos]) & 0xFF) == 255) //有匹配 第二种匹配情况 匹配数>=127
                {
                    int m = 0;
                    int n = 0;

                    m++;
                    StrPos++;
                    while ((((int)StrLine[StrPos]) & 0xFF) == 255)
                    {
                        m++;
                        StrPos++;
                    }
                    n = (((int)StrLine[StrPos]) & 0xFF) - 128;
                    Match = 127 * m + n;

                    for (int k = 0;k < Match;k++)
                    {
                        AfterTrans[TransPos++] = PreviousLine[PrePos++];
                    }

                    StrPos++;
                }
                else  //StrLine[StrPos] < 127   没有匹配，则直接将StrLine的数据拷贝到AfterTrans中
                {
                    if (StrLine[StrPos] == '\n')
                    {
                        break;
                    }
                    while ((StrLine[StrPos] != '\0') && ((((int)StrLine[StrPos]) & 0xFF)<127))
                    {
                        AfterTrans[TransPos++] = StrLine[StrPos++];
                    }

                    if (StrLine[StrPos] == '\0')  //转换结束
                        break;

                    while ((PreviousLine[PrePos] != ' ') && (PreviousLine[PrePos] != '\0'))
                    {
                        PrePos++;
                    }

                    if (PreviousLine[PrePos] == '\0') //把StrLine剩下的字符全部拷贝到AfterTrans中
                    {
                        while (StrLine[StrPos] != '\0')
                        {
                            AfterTrans[TransPos++] = StrLine[StrPos++];
                        }
                        break;
                    }

                }
            }

        }

        //更新block
        if (CurrentLineNumber <= BLOCK_SIZE - 1)
        {
            strcpy(block.BlockLine[CurrentLineNumber], AfterTrans);
        }
        else
        {
            for (int i = 0;i < BLOCK_SIZE;i++)
            {
                if (block.number[i] == 0)
                {
                    block.number[i] = BLOCK_SIZE - 1;
                    strcpy(block.BlockLine[i], AfterTrans);
                }
                else
                {
                    block.number[i]--;
                }

            }
        }

        AfterTrans[TransPos] = '\0';
        fputs(AfterTrans, fp_out);
    }


}

void InitBlock()
{
    //首先将block中所有的数据置为无效
    for (int i = 0;i < BLOCK_SIZE;i++)
    {
        block.IsValid[i] = false;

        block.number[i] = i;
    }

    //首先读取第一行记录
    fgets(StrLine, LINE_SIZE, fp_in);
    strcpy(block.BlockLine[0], StrLine);
    block.number[0] = 0;
    block.IsValid[0] = true;

    rewind(fp_in); //将文件的内部指针重新指向文件开头
}

int OpenFile()
{
    if ((fp_in = fopen(file_in, "r")) == NULL)
    {
        printf("open file error!\n");
        return -1;
    }

    if ((fp_out = fopen(file_out, "w")) == NULL)
    {
        printf("open file error!\n");
        return -1;
    }
}

int CloseFile()
{
    fclose(fp_in);
    fclose(fp_out);
    return 0;
}
