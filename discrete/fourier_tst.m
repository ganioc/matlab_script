% fourier_tst.m

syms t;

f=t*exp(-abs(t));
subplot(1,2,1);
ezplot(f);
title('连续时间信号');

F=fourier(f);
subplot(1,2,2);
ezplot(abs(F));
title('幅频特性曲线');


