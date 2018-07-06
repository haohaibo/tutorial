/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <iostream>
#include <string>
#include <string.h>
#include <memory.h>

class CEmployee{
    private:
        // 私有成员
        char szName[30];
    public:
        // 公有成员
        int salary;
        void setName(char *name);
        void getName(char *name);
        void averageSalary(CEmployee e1, CEmployee e2);
};
void CEmployee::setName(char *name){
    strcpy(szName, name);
}
void CEmployee::getName(char *name){
    strcpy(name, szName);
}
void CEmployee::averageSalary(CEmployee e1, CEmployee e2){
    salary = (e1.salary + e2.salary)/2;
}
int main(int argc, char* argv[]){
    CEmployee e;
    // 设置私有成员的目的：
    //   强制对成员变量的访问一定要通过成员函数进行
    e.setName("Wave");
    e.salary = 4000;
    return 0;
}
