% rayl.m

B=10;
m=4;
n=5;

y = raylrnd(B, m,n);
subplot(1,2,1);
hist(y,10);

x=0:0.1:3;
p=raylpdf(x,1);
subplot(1,2,2);
plot(x,p);
