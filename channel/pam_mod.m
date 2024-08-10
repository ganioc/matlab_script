% pam_mod.m， Notworking because of biterr()
nsymbol=100;
nsamp=10;
M=4;
graycode=[0,1,3,2];
EsN0=0:15;
msg=randi(4,1, nsymbol);
%msg1=graycode(msg + 1);
msg1=graycode(msg);
% msg2=pammode(msg1, M);
msg2=pammod(msg1,M);
s=rectpulse(msg2, nsamp); % 矩形脉冲成形

indx=14;
decmsg=zeros(1, nsymbol);
r=awgn(real(s), EsN0(indx) - 7, 'measured');
r1=intdump(r, nsamp);  %  相关器输出
msg_demod=pamdemod(r1, M);
decmsg=graycode(msg_demod+1);
%[err, ber(indx)]=biterr(msg, decmsg, log2(M)); % 求误比特率



%{
for indx=1:length(EsN0)
    decmsg=zeros(1, nsymbol);
    r=awgn(real(s), EsN0(indx) - 7, 'measured');
    r1=intdump(r, nsamp);  %  相关器输出
    msg_demod=pamdemod(r1, M);
    decmsg=graycode(msg_demod+1);
    
    [err, ber(indx)]=biterr(msg, decmsg, log2(M)); % 求误比特率
    %[err, ser(indx)]=symerr(msg, decmsg);
    
end
%}
%{
semilogy(EsN0,ber,'-to', EsN0, ser, '-+r', EsN0, 1.5*qfunc(sqrt(0.4*10.^(EsN0/10))));
title('4 PAM信号在AWGN信道下的性能');
xlabel('EsN0');
ylabel('误比特率和误符号率');
legend('误比特率', '误符号率', '理论误符号率');
grid on;
%}



