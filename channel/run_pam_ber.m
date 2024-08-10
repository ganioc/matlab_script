% run_pam_ber.m
EsN0=0:15;
for i=1:length(EsN0)
    SNR=EsN0(i);
    sim('pam_sys');
    ber(i)=BER(1);
    ser(i)=SER(1);
end
semilogy(EsN0, ber, '-ro',EsN0,ser,'-+r', ...
    EsN0,1.5*qfunc(sqrt(0.4*10.^(EsN0/10))));
title('4 PAM�ź���AWGN�ŵ��µ�����');
xlabel('EsN0');
ylabel('������ʺ�������');
legend('�������', '�������', '�����������');


