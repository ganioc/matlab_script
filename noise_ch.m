t=0:0.1:10;
x=sawtooth(t);
y=awgn(x, 10, 'measured');
length(x)
length(y)
plot(t,y);
hold on;
plot(t,x);
legend('ԭʼ�ź�:���Ӹ�˹�������ź�');

