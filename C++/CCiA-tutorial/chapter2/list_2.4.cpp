/*
 *
 *      Filename: list_2.4.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-05-29 22:46:02
* Last Modified: 2017-05-29 23:13:04
 **/
#include <thread>
#include <string>
#include <iostream>

void open_document_and_display_gui(std::string const &filename)
{}

bool done_editing()
{
    return true;
}

enum command_type{
    open_new_document
};

struct user_command
{
    command_type type;
    user_command():type(open_new_document)
    {}

};

user_command get_user_input()
{
    return user_command();
}

std::string get_filename_from_user()
{
    return "foo.doc";
}

void process_user_input(user_command const &cmd, std::string const &filename)
{
    std::cout << "the current thread is processing " << filename << std::endl;
}

void edit_document(std::string const &filename)
{
    open_document_and_display_gui(filename);
    while(!done_editing())
    {
        user_command cmd = get_user_input();
        if(cmd.type == open_new_document)
        {
            std::string const new_name = get_filename_from_user();
            std::cout << new_name << std::endl;
            std::thread t(edit_document, new_name);
            t.detach();
        }else
        {
            process_user_input(cmd, filename);
        }
    }
}

int main()
{
    edit_document("bar.doc");
}

