% adpcm_prj.m
Ts=1e-3;
t=0:Ts:20*Ts;
x=sin(2*pi*50*t) + 0.5*sin(2*pi*150*t);
delta=0.4;
D(1+length(t))=0;
for k=1:length(t)
    e(k)=x(k)-D(k);
    e_q(k)=delta*(2*(e(k)>=0) - 1); % ���������
    D(k+1)=e_q(k) + D(k);
    codeout(k)=(e_q(k)>0);
end

subplot(3,1,1);
plot(t,x,'-p');
axis([0,20*Ts, -2,2]);
title('ԭ�źż�����ɢ��ֵ');
ylabel('����');
hold on;

subplot(3,1,2);
stairs(t,codeout);
axis([0,20*Ts, -2,2]);
title('����������������еĲ���');
ylabel('����');

% ����
Dr(1+length(t))=0;
for k=1:length(t)
    eq(k)=delta*(2*codeout(k) - 1);
    xr(k)=eq(k)+Dr(k);
    Dr(k+1)=xr(k);
end
subplot(3,1,3);
stairs(t,xr);
hold on;
subplot(3,1,3);
plot(t,x);
title('��������ԭ�źŲ��εĶԱ�');
ylabel('����');
xlabel('ʱ��/s');



