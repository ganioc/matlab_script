% c2b.m
% 信噪比和速率/带宽的关系

k=0.1:0.001:15;
E=(2.^k-1)./k;
semilogy(10*log10(E),k,'LineWidth', 2.0);
xlabel('Eb/N0(dB)');
ylabel('Spectral Efficiency');
title('Channel capacity & Power efficiency limit');
hold on;
grid on;
xlim([-2,20]);
ylim([0.1,10]);
yL=get(gca, 'YLim');
line([-1.59,-1.59],yL,'Color','r','LineStyle','--','LineWidth',2.0);


