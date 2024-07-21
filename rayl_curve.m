% rayl_curve.m

x=[-eps:-0.02:-0.5,0:0.02:5]
x=sort(x')
b1=[0.5 1 3 5];
y1=[];
y2=[];
for i=1:length(b1)
    y1=[y1 raylpdf(x,b1(i))];
    y2=[y2 raylcdf(x,b1(i))];
end
subplot(1,2,1);
plot(x,y1);
axis square;
subplot(1,2,2);
plot(x,y2);
axis square;

