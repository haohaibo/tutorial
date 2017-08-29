/*
*
*      Filename: set_abcw.hpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-27 22:49:19
* Last Modified: 2017-08-27 22:49:19
**/
#ifndef GUARD_MIOPENGEMM_SETABCW_HPP
#define GUARD_MIOPENGEMM_SETABCW_HPP

#include <iostream>
#include <vector>

namespace MIOpenGEMM {
    namespace setabcw {
        template <typename TFloat>
            void set_abc(std::vector<TFloat>& v_a,
                         std::vector<TFloat>& v_b,
                         std::vector<TFloat>& v_c);

        template <typename TFloat>
            void set_multigeom_abc(std::vector<TFloat>& v_a,
                    std::vector<TFloat>& v_b,
                    std::vector<TFloat>& v_c);

        template <typename TFloat>
            void set_abcw(std::vector<TFloat>& v_a,
                          std::vector<TFloat>& v_b,
                          std::vector<TFloat>& v_c,
                          std::vector<TFloat>& v_workspace);

        template <typename TFloat>
            void test(TFloat& a);

        template <typename TFloat>
        void print();
    }
}

#endif /*GUARD_MIOPENGEMM_SETABCW_HPP*/
