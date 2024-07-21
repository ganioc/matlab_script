% bino.m
p1=binopdf(55,100,0.5);
p2=binocdf(55, 100, 0.5);
x=1:100;
p=binopdf(x,100,0.5);
px=binocdf(x,100,0.5);
subplot(1, 2, 1);
plot(x, p, 'rp');
xlabel('x');
ylabel('p');
title(' 分布函数');
axis square;
subplot(1,2,2);
plot(x,px,'+');
xlabel('x');
ylabel('p');
title('概率密度函数');
axis square;




