% dft_tst.m

w=-4:0.001:4;
%  产生两个信号序列
n1=-15:15;
n2=0:20;
h1=exp(-abs(0.15*n1));
h2(n2+1)=1;

% 求两个数字序列相应的DTFT的值,
Hjw1=h1*(exp(-j*pi).^(n1'*w));

subplot(2,1,1);
plot(w, abs(Hjw1));
title('H1');

Hjw2=h2*(exp(-j*pi).^(n2'*w));
subplot(2,1,2);
plot(w,abs(Hjw2));
title('H2');




