% dtft_tst2.m
w=-1:0.001:1;
% 产生两个序列
n=0:30;
h=sinc(0.25*n);
x=2*cos(0.2*pi*n) + 3*sin(0.4*n*pi);

subplot(2,2,1);
plot(n,h);

% 求脉冲响应和输入信号的DTFT,
Hjw=h*(exp(-j*pi).^(n'*w));
Xjw=x*(exp(-j*pi).^(n'*w));
% 计算输出序列的DTFT,
Yjw=Xjw.*Hjw;
n1=0:2*length(n)-2; % 确定输出序列的长度
dw=0.001*pi;    % 确定分段求和的步长,等于相邻频率的间隔,
% 用求和代替积分, 求出IDTFT
y=(dw*Yjw*(exp(j*pi).^(w'*n1)))/(2*pi);
y1=conv(x,h);
subplot(2,2,2);
plot(w, abs(Hjw));
title('H');
xlabel('pi 弧度');
ylabel('振幅');

subplot(2,2,3);
plot(w, abs(Xjw));
title('X');
xlabel('pi 弧度');
ylabel('振幅');

subplot(2,2,4);
plot(w,abs(Yjw));
title('Y');
xlabel('pi 弧度');
ylabel('振幅');

figure;
subplot(2,1,1);
stem(abs(y));
title('通过idtft计算出来的序列Y');
subplot(2,1,2);
stem(abs(y1));
title('通过时域卷积计算出来的输出序列Y1');









