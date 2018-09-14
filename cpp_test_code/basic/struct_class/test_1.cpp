#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <time.h>
#include <unistd.h>

#define MAIN_TIMING_CPU
struct Stu{

	std::string name;
	int age;
	bool sex;
	int lab;
	
	Stu(std::string name_, int age_, bool sex_, int lab_):name(name_), age(age_), sex(sex_), lab(lab_)
	{
		
	}
	
	Stu()
	{
        std::cout << "in Stu()" << std::endl;
		lab = 1;
	}
};

int main(int argc, char** argv)
{
	#ifdef MAIN_TIMING_CPU
		time_t start, end;	
	#endif
	
	#ifdef MAIN_TIMING_CPU
		time(&start);
	#endif
	printf("%d\n",sizeof(unsigned short int));
	if(2<
	     7)
	   printf("good\n");

	std::cout<<"hao hai bo"<<std::endl;
	
	Stu haohaibo("haohaibo", 22, 1, 3);
	std::cout<< haohaibo.name <<std::endl;
	std::cout<< haohaibo.age <<std::endl;
	std::cout<< haohaibo.sex <<std::endl;
	std::cout<< haohaibo.lab <<std::endl;
	
    Stu stu1;
    Stu* stu2 = new Stu();
    //std::cout << stu1.name << std::endl;
    std::cout << "stu1.lab = " << stu1.lab << std::endl;
    std::cout << "stu2.lab = " << stu2->lab << std::endl;
	int data;
	data = 1,3;	
	std::cout<< "data = " << data << std::endl;
	sleep(5);
	#ifdef MAIN_TIMING_CPU
		time(&end);
		std::cout<< "main took "<<difftime(end, start)<< " secs"<< std::endl;
	#endif
	return 0;
}
