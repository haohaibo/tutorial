#include <iostream>
#include <vector>
#include <memory>
#include <cstdio>
#include <fstream>
#include <cassert>
#include <functional>

struct B 
{
    virtual void bar()
    {
        std::cout << "B::bar" << std::endl;
    }
    virtual ~B() = default;

};
struct D: B
{
    D()
    {
        std::cout << "D::D\n";
    }
    ~D()
    {
        std::cout << "D::~D\n";
    }
    void bar() override
    {
        std::cout << "D::bar\n";
    }
};

std::unique_ptr<D> pass_through(std::unique_ptr<D> p)
{
    p->bar();
    return p;
}

void close_file(std::FILE* fp)
{
    std::fclose(fp);
}

int main()
{
    std::cout << "unique ownership semantics demo\n";
    {

        // p is a unique_ptr that owns a D
        auto p = std::make_unique<D>();
        auto q = pass_through(std::move(p));
        // now p owns nothing and holds a null pointer
        assert(!p);
        // q owns the D object
        q->bar();
    } // ~D called here

    std::cout << "Runtime polymorphism demo\n";
    {
        // p is a unique_ptr that owns a D
        std::unique_ptr<B> p = std::make_unique<D>();

        // virtual dispatch
        p->bar();

        // unique_ptr can be stored in a container
        std::vector<std::unique_ptr<B>> v;
        v.push_back(std::make_unique<D>());
        v.push_back(std::move(p));
        v.emplace_back(new D);
        for(auto& p: v)
            p->bar(); 
    } // ~D called 3 times

    std::cout << "Custom deleter demo\n";
    // prepare the file to read
    std::ofstream("demo.txt") << "x";
    {
        std::unique_ptr<std::FILE, decltype(&close_file)>
            fp(std::fopen("demo.txt","r"),&close_file);
        // fopen could have failed; in which case fp holds a null pointer
        if(fp)
            std::cout << (char)std::fgetc(fp.get()) << "\n";

    } // fclose() called here, but only if FILE* is not a null pointer 

    std::cout << "Custom lambda-expression deleter demo\n";
    {
        std::unique_ptr<D, std::function<void(D*)>>
            p(new D, [](D* ptr){
                    std::cout << "destroying from a custom deleter...\n";
                    delete ptr;
                    });
        p->bar();
    } // the lambda above is called and D is destroyed

    std::cout << "Array form of unique_ptr demo\n";
    {
        std::unique_ptr<D[]> p{new D[3]}; 
        // it calls constructor, but not call deconstructor
        // so, this is why we need unique_ptr 
        auto q = new D;

        // It's ok
        std::unique_ptr<D> s{new D};
        s->bar();
        // It's also ok
        std::unique_ptr<D> sq = std::unique_ptr<D>(new D);
        sq->bar();
    } // call ~D 3 times

    return 0;
}
