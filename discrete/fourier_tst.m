% fourier_tst.m

syms t;

f=t*exp(-abs(t));
subplot(1,2,1);
ezplot(f);
title('����ʱ���ź�');

F=fourier(f);
subplot(1,2,2);
ezplot(abs(F));
title('��Ƶ��������');


