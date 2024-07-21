% fir_1.m

x=ones(1,6)
b=[1/2,1/8,3/8]
y=conv(x,b);

subplot(3,1,1);
stem(x);
subplot(3,1,2);
stem(b);
subplot(3,1,3);
stem(y);
title('conv result y');
