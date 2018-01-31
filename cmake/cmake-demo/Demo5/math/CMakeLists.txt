# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(. DIR_LIB_SRCS)

# 指定生成 MathFunctions 链接库
add_library (MathFunctions ${DIR_LIB_SRCS})

# 指定 MathFunctions 库的安装路径
# hhb: libMathFunctions.a安装到/usr/local/bin
install (TARGETS MathFunctions DESTINATION lib)
# hhb: MathFunctions.h安装到/usr/local/include
install (FILES MathFunctions.h DESTINATION include)
