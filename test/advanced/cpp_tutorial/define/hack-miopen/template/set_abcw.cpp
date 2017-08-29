/*
*
*      Filename: set_abcw.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-27 22:45:37
* Last Modified: 2017-08-28 09:25:42
**/
#include <iostream>
#include <vector>
#include "set_abcw.hpp"

namespace MIOpenGEMM {
    namespace setabcw {
        template <typename TFloat>
            void set_abc(std::vector<TFloat>& v_a,
                    std::vector<TFloat>& v_b,
                    std::vector<TFloat>& v_c)
            {
                std::cout << "set_abcw is calling set_abc.."
                    << std::endl;
            }

        template <typename TFloat>
            void set_multigeom_abc(std::vector<TFloat>& v_a,
                    std::vector<TFloat>& v_b,
                    std::vector<TFloat>& v_c)
            {

            }

        template <typename TFloat>
            void set_abcw(std::vector<TFloat>& v_a,
                    std::vector<TFloat>& v_b,
                    std::vector<TFloat>& v_c,
                    std::vector<TFloat>& v_workspace)
            {
                //set_abc(v_a, v_b, v_c);
                //set_abc<TFloat>(v_a, v_b, v_c);
                std::cout << "set_abcw ..." << std::endl;
            }

        template <typename TFloat>
            void test(TFloat& a)
            {
                std::cout << "testing set_abcw.hpp" << std::endl;
            }

        template <typename TFloat>
        void print(){
            std::cout << ".................." << std::endl;
        }

        template void test(double& a); //显式实例化
        template void test(float& a);

        template void print<double>();
        template void print<float>();
   }
}

