% unif.m

x = -1:0.05:7;
pdf=unifpdf(x,0,6);
subplot(1,2,1);
plot(x,pdf);
axis([-1 7 0 0.3]);
axis square;

cdf=unifcdf(x,0,6);
subplot(1,2,2);
plot(x,cdf);
axis([-1 7 0 1.2]);
axis square;

