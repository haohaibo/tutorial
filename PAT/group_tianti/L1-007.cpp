#include <iostream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

typedef struct
{
    string pinyin;
}NUMBER;

int main()
{
    NUMBER *Number = new NUMBER[10];
    Number[0].pinyin = "ling";
    Number[1].pinyin = "yi";
    Number[2].pinyin = "er";
    Number[3].pinyin = "san";
    Number[4].pinyin = "si";
    Number[5].pinyin = "wu";
    Number[6].pinyin = "liu";
    Number[7].pinyin = "qi";
    Number[8].pinyin = "ba";
    Number[9].pinyin = "jiu";

    string input;
    cin >> input;
    for(int i = 0; i < input.size(); ++i)
    {
        if(i < input.size() -1)
        {

            if(input[i] == '-')
            {
                cout << "fu ";
            }else
            {
                cout << Number[(int)(input[i] - '0')].pinyin << " "; 
            }
        }else
        {
            if(input[i] == '-')
            {
                cout << "fu" << endl;
            }else
            {
                cout << Number[(int)(input[i] - '0')].pinyin << endl; 
            }
        } 
    }
    return 0;
}
