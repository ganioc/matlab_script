% simu comm
x=0:0.051:0.2;
y=x;


for i=1:length(x)
    ERR=x(i);
    sim('comm_simu');
    y(i)=out.tout(length(out.tout));
end


plot(x,y);
grid on;

