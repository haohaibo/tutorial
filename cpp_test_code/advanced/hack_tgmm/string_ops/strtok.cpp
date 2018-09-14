/*
*
*      Filename: strtok.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-07-02 21:07:13
* Last Modified: 2017-07-02 21:18:43
**/
#include <iostream>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

// char* strtok(char s[], char* delim);
int main(int argc, char* argv[])
{
    char sentence[] = "This is a sentence with 7 tokens";
    std::cout << "This string to be tokenized is:\n"
        << sentence << "\n\nThe tokens are:" << std::endl;
    char *tokenPtr = strtok(sentence, " ");
    while(tokenPtr != NULL)
    {
        std::cout << tokenPtr << std::endl;
        tokenPtr = strtok(NULL, " ");
    }
    return 0;
}


