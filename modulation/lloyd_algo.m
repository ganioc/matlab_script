% lloyd_alg.m

n=2^3;
t=[0:100]*pi/20;
y=cos(t);
[a,b]=lloyds(y,n);
[index,quant, distor]=quantiz(y,a,b);
axis([-1 1 0 16]);
plot(t,y, t,quant,'rp');
