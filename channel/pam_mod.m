% pam_mod.m�� Notworking because of biterr()
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
s=rectpulse(msg2, nsamp); % �����������

indx=14;
decmsg=zeros(1, nsymbol);
r=awgn(real(s), EsN0(indx) - 7, 'measured');
r1=intdump(r, nsamp);  %  ��������
msg_demod=pamdemod(r1, M);
decmsg=graycode(msg_demod+1);
%[err, ber(indx)]=biterr(msg, decmsg, log2(M)); % ���������



%{
for indx=1:length(EsN0)
    decmsg=zeros(1, nsymbol);
    r=awgn(real(s), EsN0(indx) - 7, 'measured');
    r1=intdump(r, nsamp);  %  ��������
    msg_demod=pamdemod(r1, M);
    decmsg=graycode(msg_demod+1);
    
    [err, ber(indx)]=biterr(msg, decmsg, log2(M)); % ���������
    %[err, ser(indx)]=symerr(msg, decmsg);
    
end
%}
%{
semilogy(EsN0,ber,'-to', EsN0, ser, '-+r', EsN0, 1.5*qfunc(sqrt(0.4*10.^(EsN0/10))));
title('4 PAM�ź���AWGN�ŵ��µ�����');
xlabel('EsN0');
ylabel('������ʺ��������');
legend('�������', '�������', '�����������');
grid on;
%}



