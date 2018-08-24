#include <iostream>
#include <string.h>
#include <string>

class Person{

    //private by default 
    //float salary;

    public:
        std::string name;
        int age;
        bool gender;
};

int main(){
    Person person = Person{"Haibo hao", 10, 0};
    std::cout << "name: " << person.name << "\n"
        << "age: " << person.age << "\n"
        << "gender: " << [](bool gender){ if(!gender)return "male"; return "female";}(person.gender)
        << std::endl;
    return 0;
}
