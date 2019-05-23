#include<iostream>
#include<memory>

using namespace std;

// shared_ptr陷阱 ： 当外部用std::shared_ptr<T> & 的时候
int main()
{
   
   shared_ptr<int> p(new int{8});
   	
   shared_ptr<int>& f = p;
   cout << "xxxxxx  " << *f.get() << endl;
   

   int* q;
   {
	shared_ptr<int> shared(new int{90});
	cout << shared.use_count() << endl;
	
	//f = shared;
	//cout << "2333  " << *f.get() << endl;
	
	q = shared.get();
	cout << "in *q = " << *q << endl;
	cout << "in q = " << q << endl;
	
	
   }
   
   cout << "\n\nout = *q = " << *q << endl;
   cout << "out q = " << q << endl;
   
   cout << "sssss  " << *f.get() << endl;
   
   

    return 0;
} 
