% DFT_tst.m
n=0:30;
x=cos(0.25*n).*exp(-0.15*n);
% 这个是信号序列

k=0:30;
N=31;
% 根据DFT的定义计算序列的DFT值
Wnk=exp(-j*2*pi/N).^(n'*k);
X=x*Wnk;
subplot(2,1,1);
stem(n,x);
title('序列x');

subplot(2,1,2);
stem(-15:15, [abs(X(17:end)) abs(X(1:16))]);
title('X幅度');

