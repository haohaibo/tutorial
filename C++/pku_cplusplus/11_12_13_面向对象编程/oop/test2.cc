#include <iostream>
#include <stdio.h>
#include <memory.h>
#include <string>
#include <vector>
#include <stdlib.h>

using namespace std;

vector<string> splitWithSTL(string str, const string split){
    vector<string> resVec;
    if(str == ""){
        return resVec;
    }
    str = str + split;
    int length = str.length();
    int pos = str.find(split);
    while(pos != string::npos){
        string trunk = str.substr(0,pos);
        //cout << trunk << endl;
        resVec.push_back(trunk);
        str = str.substr(pos+1,length);
        pos = str.find(split);
    }
    return resVec;
}

class Stu{
    private:
        string name;
        int age;
        string stu_no;
        int avg_1, avg_2, avg_3, avg_4;
};
int main(){
    string s;
    getline(cin,s);
    vector<string> result;
    result = splitWithSTL(s,",");
    int avg_score = 0;
    int num_course=0;
    for(int i = 3; i < result.size(); ++i){
        avg_score += atoi(result[i].c_str());
        ++num_course;
    }

    avg_score /= num_course;
    for(int i = 0; i < 3; ++i){
        cout << result[i] << ",";
    }
    cout << avg_score << endl;

    return 0;
} 
