*****readme.md for the 3 assignments******
实验一：
homework1_1: 作业1的DFT变换的频谱图及反变换之后的结果。
homework1_2: 作业1的DCT变换的能量图及反变换之后的结果。
002为原图
1-1dft为进行dft之后频谱的图像
1-1dftabs为dft之后取模长 然后平移之后的图像
1-1idftimage为原图进行逆变换的图像
dct为进行dct的图像
idct为进行逆变换的图像

实验二：
homework2：  作业2的8x8分块处理后的DCT压缩变换
005为原图
dct6是按照实验要求保留了六条对角线
dct4是自己的对比试验，保留了四条对角线

实验三：
homework3：  作业3 交换相位和幅度信息
002 003为原图
switch1和switch2对应交换过之后的图片

每个脚本文件中都有需要调用的函数
相关函数声明：
function [out] = twodft(image) 对图片进行二维dft变换
function [iout] = itwodft(iimage) 进行二维dft逆变换
function [out] = mydct(f) 对图片进行二维dct变换
function [out] = imydct(f) 进行二维dct逆变换

*****作者：胡洪宇  学号：517021910310 邮箱：592133077@qq.com*******



