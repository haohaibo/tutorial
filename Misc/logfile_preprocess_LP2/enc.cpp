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
#include<stdio.h>
#include<stdlib.h>
#include<iostream>
#include<string>
#include<vector>
#include<time.h>
#include<string.h>

#define BLOCK_SIZE 16    //参考的block块的大小
#define LINE_SIZE 4096

//using namespace std;

clock_t start, finish;
double duration;

char *file_in;
char *file_out;
FILE *fp_in, *fp_out;

char StrLine[LINE_SIZE]; //每行读取的字符串 当前要处理的行
char FirstLine[LINE_SIZE]; //保存第一行记录
char AfterTrans[LINE_SIZE]; //保存每行转换后的字符串
char PreviousLine[LINE_SIZE]; //
char RefLine[LINE_SIZE];

int TotalLinesOfOpenFile = 0;  //要处理的文件的总行数

int NumberOfLine = 0;  //在block中，一直保存最近的BLOCK_SIZE个previous line
int CurrentLineNumber = 0; //当前要处理的line的编号 从0开始

int TransPos = 0; //用来将转换后的字符写入AfterTrans[]数组

int CursorOfStrLine = 0; //cursor of StrLine
int CursorOfPreviousLine = 0;  //cursor of  previous line

int LineMatchLength = 0;  //每个line总共匹配的长度
int MaxLineMatchLength = 0; //找出在block中匹配的最大长度

int MatchLength = 0; //每次部分匹配得到的长度

int MaxMatchRefNumber = 0;  //得到的最大匹配对应在block中的编号

long long sum = 0;

//用循环数组来存储BLOCK 
typedef struct
{
    char BlockLine[BLOCK_SIZE][LINE_SIZE]; //每次参考一个block
    int number[BLOCK_SIZE];  //对应的编号
    bool IsValid[BLOCK_SIZE]; //是否保存着有效的line 
}Block;
Block block;

//字符串切分
void split(char *src, const char *separator, char **dest, int *num);
//将当前要处理的line与block中的一个line进行匹配
void EachLineMatch();
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
    printf("sum = %lld\n", sum);
    CloseFile();
    finish = clock();
    duration = (double)(finish - start) / CLOCKS_PER_SEC;

    printf("Elapsed time: %fseconds\n", duration);
    printf("Everything is Ok\n");
    return 0;
}


/*-----------------Open file-------------------*/
int OpenFile()
{
    if ((fp_out = fopen(file_out, "w")) == NULL) //判断文件是否存在以及可读
    {
        printf("open file error!\n");
        return -1;
    }

    if ((fp_in = fopen(file_in, "r")) == NULL) //判断文件是否存在以及可读
    {
        printf("open file error!\n");
        return -1;
    }
}

/*------------------Close file--------------------*/
int CloseFile()
{
    fclose(fp_in);
    fclose(fp_out);
    return 0;
}

/*------------------split function-------------------*/
void split(char *src, const char *separator, char **dest, int *num)
{

}

/*----------------initialize block--------------------*/
void InitBlock() //对block初始化 读取最开始的BLOCK_SIZE个line
{
    //首先将block中所有的数据置为无效
    for (int i = 0;i < BLOCK_SIZE;i++)
    {
        block.IsValid[i] = false;
        block.number[i] = i;
    }

    //首次填充block，读取前BLOCK_SIZE个line
    for (int i = 0;i < BLOCK_SIZE;i++)
    {
        if (!feof(fp_in))
        {
            fgets(StrLine, LINE_SIZE, fp_in);
            strcpy(block.BlockLine[i], StrLine);
            block.number[i] = i % BLOCK_SIZE;
            block.IsValid[i] = true;
        }
        else
        {
            break;
        }

    }

    rewind(fp_in); //将文件的内部指针重新指向文件开头
}

/*-----------------------------each line match--------------------------------*/
/*
   给一个当前行StrLine[i]，和参考的行进行匹配  可以统计出总共匹配了LineMatchLength个字符
   然后可以进行替换
   */
void EachLineMatch()
{
    int StrPos = 0, PrePos = 0;
    TransPos = 0;
    LineMatchLength = 0;

    AfterTrans[TransPos++] = MaxMatchRefNumber + 128;
    while (StrLine[StrPos] != '\0')
    {
        MatchLength = 0;


        while ((StrLine[StrPos] == PreviousLine[PrePos])&(StrLine[StrPos] != '\0')&(PreviousLine[PrePos] != '\0'))
        {
            StrPos++;
            PrePos++;
            MatchLength++;

        }

        if (MatchLength == 0) //当前没有匹配
        { //当前没有匹配时，就把直到空格之前的所有字符拷贝下来

            while ((StrLine[StrPos] != ' ') && (StrLine[StrPos] != '\0'))
            {
                AfterTrans[TransPos] = StrLine[StrPos];
                //printf("%c", AfterTrans[TransPos]);
                StrPos++;
                TransPos++;
            }

            while ((PreviousLine[PrePos] != ' ') && (PreviousLine[PrePos] != '\0'))
            {
                PrePos++;
            }

            //不跳过空格，把它当做普通字符

            if (StrLine[StrPos] == '\0')
            {
                //当前的line处理完毕
                break;
            }

            if (PreviousLine[PrePos] == '\0')
            {
                //参考的line已经到了末尾，此时不在进行匹配，直接把StrLine剩下的字符拷贝到AfterTrans中 当前的line处理完毕
                while (StrLine[StrPos] != '\0')
                {
                    AfterTrans[TransPos++] = StrLine[StrPos++];
                }
                break;
            }

        }
        else
        {
            if (MatchLength < 127)  //当MatchLength<127时，编码为 128+MatchLength
            {
                AfterTrans[TransPos++] = MatchLength + 128;

                if (StrLine[StrPos - 1] == '\n')
                {
                    AfterTrans[TransPos++] = '\n';
                    break;
                }

                while ((StrLine[StrPos] != ' ') && (StrLine[StrPos] != '\0'))
                {
                    AfterTrans[TransPos] = StrLine[StrPos];
                    StrPos++;
                    TransPos++;
                }

                while ((PreviousLine[PrePos] != ' ') && (PreviousLine[PrePos] != '\0'))
                {
                    PrePos++;
                }

                //不跳过空格，把它当做普通字符

                if (StrLine[StrPos] == '\0')
                {
                    //当前的line处理完毕
                    break;
                }

                if (PreviousLine[PrePos] == '\0')
                {
                    //参考的line已经到了末尾，此时不在进行匹配，直接把StrLine剩下的字符拷贝到AfterTrans中 当前的line处理完毕
                    while (StrLine[StrPos] != '\0')
                    {
                        AfterTrans[TransPos++] = StrLine[StrPos++];
                    }
                    break;
                }

            }
            else  //MatchLength >= 127时，编码为m+1个字节, 其中 MatchLength = 127*m + n;
            {
                int m, n;
                m = MatchLength / 127;
                n = MatchLength - 127 * m;

                int temp = m;
                while (temp--)
                {
                    AfterTrans[TransPos] = 255;
                    TransPos++;
                }
                AfterTrans[TransPos] = n +128;
                TransPos++;

                if (StrLine[StrPos - 1] == '\n')
                {
                    AfterTrans[TransPos++] = '\n';
                    break;
                }

                while ((StrLine[StrPos] != ' ') && (StrLine[StrPos] != '\0'))
                {
                    AfterTrans[TransPos] = StrLine[StrPos];
                    StrPos++;
                    TransPos++;
                }


                while ((PreviousLine[PrePos] != ' ') && (PreviousLine[PrePos] != '\0'))
                {
                    PrePos++;
                }


                //不跳过空格，把它当做普通字符

                if (StrLine[StrPos] == '\0')
                {
                    //当前的line处理完毕
                    break;
                }

                if (PreviousLine[PrePos] == '\0')
                {
                    //参考的line已经到了末尾，此时不在进行匹配，直接把StrLine剩下的字符拷贝到AfterTrans中 当前的line处理完毕
                    while (StrLine[StrPos] != '\0')
                    {
                        AfterTrans[TransPos++] = StrLine[StrPos++];
                    }
                    break;
                }
            }
        }


        LineMatchLength += MatchLength;
    }

}


/*-----------------------------CalcMatchLength--------------------------------*/
/*
   给一个当前行StrLine[i]，和参考的行进行匹配  可以统计出总共匹配了LineMatchLength个字符
   */

void CalcMatchLength()
{
    int i = 0, j = 0;

    LineMatchLength = 0;
    while (StrLine[i] != '\0')
    {
        MatchLength = 0;


        while (StrLine[i] == PreviousLine[j])
        {
            i++;
            j++;
            MatchLength++;
        }

        if (MatchLength == 0) //当前没有匹配
        {
            //当前没有匹配时，就把直到空格之前的所有字符拷贝下来

            while ((StrLine[i] != ' ') && (StrLine[i] != '\0'))
            {
                i++;
            }


            while ((PreviousLine[j] != ' ') && (PreviousLine[j] != '\0'))
            {
                j++;
            }

            if (StrLine[i] == ' ') //跳过空格
            {
                i++;
            }

            if (PreviousLine[j] == ' ') //跳过空格
            {
                j++;
            }

        }
        else
        {
            if (MatchLength < 127)  //当MatchLength<127时，编码为 128+MatchLength
            {
                //AfterTrans[TransPos++] = MatchLength + 128;

                while ((StrLine[i] != ' ') && (StrLine[i] != '\0'))
                {
                    i++;
                }

                while ((PreviousLine[j] != ' ') && (PreviousLine[j] != '\0'))
                {
                    j++;
                }

                if (StrLine[i] == ' ') //跳过空格
                {
                    i++;
                }

                if (PreviousLine[j] == ' ') //跳过空格
                {
                    j++;
                }

            }
            else  //MatchLength >= 127时，编码为m+1个字节, 其中 MatchLength = 127*m + n;
            {
                int m, n;
                m = MatchLength / 127;
                n = MatchLength - 127 * m;

                int temp = m;

                while ((StrLine[i] != ' ') && (StrLine[i] != '\0'))
                {
                    i++;
                }

                while ((PreviousLine[j] != ' ') && (PreviousLine[j] != '\0'))
                {
                    j++;
                }

                if (StrLine[i] == ' ') //跳过空格
                {
                    i++;
                }

                if (PreviousLine[j] == ' ') //跳过空格
                {
                    j++;
                }
            }
        }


        LineMatchLength += MatchLength;
    }

}


/*-----------------------------------the main processing------------------------------*/
void MainProcess()  	//主要处理过程
{
    TotalLinesOfOpenFile = 0;

    //读取第一行
    fgets(FirstLine, LINE_SIZE, fp_in);
    TotalLinesOfOpenFile++;
    CurrentLineNumber = 0;

    fputs(FirstLine, fp_out);  //转换结果写入output文件 对于第一个line，就直接写入

    strcpy(PreviousLine, FirstLine);

    while ((fgets(StrLine, LINE_SIZE, fp_in))!=NULL)
    {
        TotalLinesOfOpenFile++;
        CurrentLineNumber++;
        TransPos = 0;
        MaxLineMatchLength = 0;

        if (CurrentLineNumber < BLOCK_SIZE) //根据初始block中的信息来进行最大匹配
        {
            //填充block块
            strcpy(block.BlockLine[CurrentLineNumber], StrLine);
            block.number[CurrentLineNumber] = CurrentLineNumber;


            for (int i = CurrentLineNumber - 1;i >= 0;i--)
            {
                strcpy(PreviousLine, block.BlockLine[i]);

                CalcMatchLength();

                if (MaxLineMatchLength < LineMatchLength)
                {
                    MaxLineMatchLength = LineMatchLength;
                    MaxMatchRefNumber = i;
                }
            }

            strcpy(PreviousLine, block.BlockLine[MaxMatchRefNumber]);
            EachLineMatch();
        }
        else   //更加一般的情况，即每次参考当前的block的BLOCK_SIZE个line
        {
            for (int i = BLOCK_SIZE - 1;i >= 0;i--)
            {
                strcpy(PreviousLine, block.BlockLine[i]);
                CalcMatchLength();

                if (MaxLineMatchLength < LineMatchLength)
                {
                    MaxLineMatchLength = LineMatchLength;
                    MaxMatchRefNumber = i;
                }
            }

            strcpy(PreviousLine, block.BlockLine[MaxMatchRefNumber]);
            EachLineMatch();

            //更新block
            for (int i = 0;i < BLOCK_SIZE;i++)
            {
                if (block.number[i] == 0)
                {
                    block.number[i] = BLOCK_SIZE - 1;
                    strcpy(block.BlockLine[i], StrLine);
                }
                else
                {
                    block.number[i]--;
                    block.number[i] = block.number[i] % BLOCK_SIZE;
                }
            }
        }
        AfterTrans[TransPos] = '\0';
        sum += TransPos;
        fputs(AfterTrans, fp_out);  //转换结果写入output文件
    }
    printf("TotalLinesOfOpenFile=%d\n", TotalLinesOfOpenFile);
}
