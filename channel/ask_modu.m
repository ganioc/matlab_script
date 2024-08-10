% ask_modu.m
n=1:8192;
m=1:128;
x(n)=randi(2,1,8192);
x=[x(n)]';
y(n)=zeros(1,8192);
z(m)=zeros(1,128);
for n=1:8192
    for m=1:128
        if n==64*m-63 % 当m为64的整数倍时对z赋值
           z(m)=x(n);
           if m==ceil(n/64);
               y(((64*m-63):(64*m))')=z(m);
           end
        end
    end
end
n=1:8192;
rm2=y(n);
x2=rm2;  % 产生基带信号，64为最小长度的随机二进制序列
n=[1:(2^13)];
x1=cos(n.*1e9*2*pi/4e9);  % 载频为1GHz
x=x1.*x2;
b=blackman(2^13);    % 窗函数
X=b'.*x;
x3=[ones(1,64) zeros(1,8128)]; % 独个基带单元码元
y1=X(1:(2^13));
y4=x1.*x3;
Y1=fft(y1,(2^13));
magY1=abs(Y1(1:1:(2^12)+1))/200;  % 求FFT
Y4=fft(y4,(2^13));
magY4=abs(Y4(1:1:(2^12)+1))/37;
k1=0:(2^12);
w1=(2*pi/(2^13))*k1;
u=(2*w1/pi)*1e9;
figure(1);
subplot(2,1,1);
plot(u,magY1,'b',u, magY4,'r-');
grid on;
title('ASKr');
axis([4e8,1.6e9,0,1.1]);

X2=b'.*x2;  % 基带信号加宽
y2=X2(1:(2^13));
Y2=fft(y2,(2^13));
magY2=abs(Y2(1:1:(2^12)+1))/(200) + eps; % 求FFT
k1=0:(2^12);
w1=(2*pi/(2^13))*k1;
u=(2*w1/pi)*1e9;
Y3=fft(x3,(2^13));
magY3=abs(Y3(1:1:(2^12)+1))/(35) + eps; % 求FFT
subplot(2,1,2);
plot(u,magY2,'b',u,magY3,'r-');
grid on;
title('ASKr-modulation');
axis([0,1.2e9,3e-2,3]);
figure(2);
subplot(2,1,1);
plot(n,x2);
title('ASKr');
axis([0,640, -0.2,1.2]);
grid on;
subplot(2,1,2);
plot(n,x);
axis([0,640,-1.2,1.2]);
grid on;




