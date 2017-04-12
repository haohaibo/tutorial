/*
*
*      Filename: proj3_5_1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-11 23:22:15
* Last Modified: 2017-04-11 23:22:15
**/
#include <iostream>
#include <bitset>
#include <string>
using std::bitset;
using std::cin;
using std::cout;
using std::endl;
using std::string;

int main()
{
    // bitvec1 is smaller than the initializer
    bitset<16> bitvec1(0xffff); // bits 0..15 are set to 1

    // bitvec2 same size as initializer
    bitset<32> bitvec2(0xffff); // bits 0..15 are set to 1; 16..31 are 0
    cout << "bitvec2: " << bitvec2 << endl;

    // on a 32-bit machine; bits 0 to 31 initialized from 0xffff
    bitset<128> bitvec3(0xffff); // bits 32 through 127 initialized to zero

    // 读入位集的顺序是从右向左
    string strval("1100");
    bitset<32> bitvec4(strval);

    string str("1111111000000000111111");
    bitset<32> bitvec5(str, 5, 4); // 4 bits staring at str[5], 1100
    bitset<32> bitvec6(str, str.size() - 4); // use last 4 characters
    
    bool is_set = bitvec5.any();  // false, if all bits are zero
    bool is_not_set = bitvec5.none(); // ture, if all bits are zero
    size_t bits_set = bitvec5.count(); // returns number of bits that are one
    cout << "is_set = " << is_set << endl;
    cout << "is_not_set = " << is_not_set << endl;
    cout << "bit_set = " << bits_set << endl;
    size_t bit_size = bitvec5.size(); 
    cout << "bit_size = " << bit_size << endl;

    //// assign 1 to even numbered bits
    //for(int index = 0; index != 32; index+=2)
    //{
    //    bitvec5[index] = 1;
    //}
    // equivalent loop using set operation
    
    for(int index = 0; index != 32;  index += 2)
    {
        bitvec5.set(index);
    }

    for(int index = 0; index != 32; ++index)
    {
        cout << "bitvec5[" << index << "]" << " = " << bitvec5[index] << "\t";
    }

    cout << "\n" << endl;
    bitvec5.set(); // set all the bits to 1;

    for(int index = 0; index != 32; ++index)
    {
        cout << "bitvec5[" << index << "]" << " = " << bitvec5[index] << "\t";
    }
    
    cout << "\n" << endl;
    bitvec5.reset();
    for(int index = 0; index != 32; ++index)
    {
        cout << "bitvec5[" << index << "]" << " = " << bitvec5[index] << "\t";
    }

    cout << "\n" << endl;
    bitvec5.flip(0);
    for(int index = 0; index != 32; ++index)
    {
        cout << "bitvec5[" << index << "]" << " = " << bitvec5[index] << "\t";
    }

    cout << "\n" << endl;
    bitvec5[0].flip();
    for(int index = 0; index != 32; ++index)
    {
        cout << "bitvec5[" << index << "]" << " = " << bitvec5[index] << "\t";
    }

    cout << "\n" << endl;
    bitvec5.flip();
    for(int index = 0; index != 32; ++index)
    {
        cout << "bitvec5[" << index << "]" << " = " << bitvec5[index] << "\t";
    }

    cout << "\n" << endl;
    bitvec5.flip();
    bitvec5.set(0);
    bitvec5.set(4);
    cout << "bitvec5.to_ulong() = " << bitvec5.to_ulong() << endl;
    return 0;
}

