% mpsk_simu.m
n=10000;  % 发送的符号数
T=1; % 符号周期
fs=100;  %  采样点数
ts=1/fs;
t=0:ts:T-ts;
fc=10;    % 载波频率
c=sqrt(2/T)*exp(j*2*pi*fc*t); % 载波信号
subplot(2,3,1);
plot(c,'g');
title('载波信号');

c1=sqrt(2/T)*cos(2*pi*fc*t); % 同相载波
c2=-sqrt(2/T)*sin(2*pi*fc*t); % 正交载波
M=8;
graycode=[0,1,2,3,6,7,4,5];
SNR=0:15;
snr1=10.^(SNR/10);
msg=randi(M, 1, n); % 生成消息序列
subplot(2,3,2);
plot(msg);
title('基带信号');

msg1=graycode(msg); % 绝对码表示为相对码, 幅值相位表示
msgmod=pskmod(msg1,M).'; % 基带8-psk调制
subplot(2,3,3);
plot(msgmod, 'r');
title('基带调制');

tx=real(msgmod*c);
subplot(2,3,4);
plot(tx);
title('载波调制');

tx1=reshape(tx.',1,length(msgmod)*length(c)); % 调整矩阵行数列数
spow=norm(tx1).^2/n; %求每个符号的平均功率
for indx=1:length(SNR)
    sigma=sqrt(spow/(2*snr1(indx))); % 根据符号求噪声功率
    rx=tx1+ sigma*randn(1,length(tx1));
    rx1=reshape(rx,length(c),length(msgmod));
    r1=(c1*rx1)/length(c1);
    r2=(c2*rx1)/length(c2);
    r=r1+j*r2;
    y=pskdemod(r,M); % 8psk解调
    decmsg=graycode(y+1);
    [err, ber(indx)]=biterr(msg, decmsg);
    [err, ser(indx)]=symerr(msg, decmsg);
end
subplot(2,3,5);
plot(r,'k');
title('加噪声的已调信号');

subplot(2,3,6);
plot(y);
title('8psk解调');

figure(2);
ser1=2*qfunc(sqrt(2*snr1)*sin(pi/M)); % 理论误符号率
ber1=1/log2(M)*ser1;
semilogy(SNR, ber,'-ko', SNR, ser,'-r*',SNR,ser1,'', SNR,ber1,'-b');
title('8psk载波调制信号在AWGN信道下的性能');
xlabel('EsN0');
ylabel('误比特率和误符号率');
legend('误比特率', '误符号率', '理论误符号率', '理论误比特率');


