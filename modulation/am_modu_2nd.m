% am modu, 2nd case

ts=0.0025;          % 信号采样时间间隔
t=0:ts:5-ts;        % 时间序列
fs=1/ts;            % 采样频率, 400Hz,
msg=randi([-3,3],10,1);  % 生成原始信号，随机种子123
msg1=msg*ones(1,fs/2);   % 扩展成取样信号形式， 10x200的一个矩阵,
msg2=reshape(msg1.',1,length(t)); % 这是什么意思?
fprintf("msg2 length: %d\n", length(msg2));  %  2000

subplot(3,1,1);
plot(t,msg2);
title('原始信号');

A=4;
fc=200;         % 载波频率
Sam=(A+msg2).*cos(2*pi*fc*t);  %  已调信号
dems=abs(hilbert(Sam)) - A;    %  包络检波并去除直流分量
subplot(3,1,2);
plot(t,dems);
title('无噪声的解调信号');

y=awgn(Sam, 24, 'measured');
dems2=abs(hilbert(y)) - A;
subplot(3,1,3);
plot(t,dems2);
title('信噪比为24dB时的解调信号');





