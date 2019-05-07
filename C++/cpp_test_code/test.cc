#include <iostream>
#include <vector>

struct Person {
    int age;
    bool gender;
    Person(int _age, bool _gender): age(_age), gender(_gender){}
};
int main(){
    std::vector<Person> v;
    Person s1(5,1);
    std::cout << s1.age << std::endl;
    v.push_back(s1);
    return 0;
}
