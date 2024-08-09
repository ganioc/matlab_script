%
nsamp=10;
s0=[ones(1,nsamp)]; % 基带脉冲信号
s1=[ones(1,nsamp/2) -ones(1,nsamp/2)];
nsymbol=10000;      % 发送的符号数
EbN0=0:12;          % 信噪比 Eb/N0
msg=randi([0,1],1,nsymbol);


s00=zeros(nsymbol,1);
s11=zeros(nsymbol,1);
indx=find(msg==0);
s00(indx)=1;
s00=s00*s0;

indx1=find(msg==1);
s11(indx1)=1;
s11=s11*s1;

s=s00+s11; % 总的发送波形
s=s';


for indx=1:length(EbN0)
    decmsg=zeros(1, nsymbol);
    r=awgn(s, EbN0(indx) - 7);
    r00=s0*r;
    r11=s1*r;
    indx1=find(r11>=r00);
    decmsg(indx1)=1;    % 判决
    [err, ber(indx)]=biterr(msg, decmsg);
end
%{
%}

semilogy(EbN0, ber, '-ko', EbN0, qfunc(sqrt(10.^(EbN0/10))));
title('二进制正交信号误比特率性能');
xlabel('EbN0');
ylabel('误比特率Pe');
legend('仿真结果', '理论结果');


