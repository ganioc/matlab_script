% poisson.m

lambda=4;
len = 5;
y1 = poissrnd(lambda, [1 len]);
P=3;
Q=4;
y2 = poissrnd(lambda, P, Q);

M = 1000;
y3=poissrnd(lambda, [1 M]);
figure(1);
t=0:1:max(y3);
hist(y3,t);
axis([0 max(y3) 0 250]);
xlabel('取值');
ylabel('计数值');