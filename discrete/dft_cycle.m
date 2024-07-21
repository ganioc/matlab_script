% DFT_cycle.m

% 产生两个序列
h=[6 ,3,4,2,1,-2];
x=[3,2,6,7,-1,-3];

h1=fliplr(h)  % 反转序列
H=toeplitz(h, [h(1) h1(1:5)]) % 利用toeplitz函数生成循环矩阵
y=H*x';     % 计算卷积序列
% 计算两个序列的DFT值,
H=fft(h);
X=fft(x);
Y=H.*X;
y1=ifft(Y); % 逆快速Fourier变换计算循环卷积序列

subplot(2,1,1);
stem(y);
title('直接计算');
subplot(2,1,2);
stem(y1);
title('DFT计算');








