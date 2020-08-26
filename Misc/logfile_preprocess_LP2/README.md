# logfile_preprocess_LP2

论文Fast and efficient log file compression的 Transform variant 2的实现
对tar.gz的access.log文件的压缩比平均可以提升17%~18%

example_in.log是样例输入文件

执行make命令，生成enc和dec两个可执行文件
enc:对应编码过程    
执行命令: ./enc  example_in.log  example_enc.log

dec:对应解码过程   
执行命令: ./dec  example_enc.log example_dec.log

其中example_in.log 为原始日志文件，example_enc.log为预处理后生成的文件
example_dec.log为还原的日志文件

 
