% coheren.m

N=500;
n=0:N-1;
ns=randn(1,N);
k=0:N-1;
x0=k.*(0.95.^k);
x1=k*0;
x2=k*0;
x=k*0;

for k=200:N
    x1(k)=(k-200).*(0.9.^(k-200));
end

for k=300:N
    x2(k)=(k-300).*(0.85.^(k-300));
end

x=x0+x1+x2;
y=x+ns;

subplot(3, 2, 1);
stem(n,x(n+1),'.');
title('signal x');
grid on;

subplot(3,2,2);
stem(n,ns(n+1),'.');
title('noise ns');
grid on;

subplot(3,2,3);
stem(n, y(n+1),'.');
title('�ϳ��ź�');
grid on;

subplot(3,2,4);
[Ryy,n]=xcorr(y,y);
stem(n, Ryy/N, 'r.');
title('�ź�y�������');

subplot(3,2,5);
[Rxx,n]=xcorr(x,x);
stem(n, Rxx/N,'b.');
title('�ź�x�������');
grid on;

[Rnn,n]=xcorr(ns,ns);
subplot(3,2,6);
stem(n,Rnn/N, 'r.');
title('����ns�������');
grid on;








