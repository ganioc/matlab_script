% BER
s0=0;
s1=5;
P0=0.7;
P1=1-P0;
A2_over_sigma2_dB=-5:0.5:20;
A2_over_sigma2=10.^(A2_over_sigma2_dB./10);
sigma2=s1^2./A2_over_sigma2;
N=1e5;

for k=1:length(sigma2)
    X=(rand(1,N)>P0);
    n=sqrt(sigma2(k)).*randn(1,N);
    xi=s1.*X + n;
    C_opt=(s0+s1)/2 + sigma2(k)/(s1-s0)*log(P0./P1); 
    % 计算最佳判决门限
    y=(xi>C_opt);
    err(k)=(sum(X-y ~= 0))./N;
end
semilogy(A2_over_sigma2_dB, err, 'ro');
hold on;

for k=1:length(sigma2)
    C_opt=(s0+s1)./2 + sigma2(k)./(s1-s0).*log(P0./P1);
    Pe0=0.5-0.5*erf((C_opt - s0)/(sqrt(2*sigma2(k)))); % 发0的出错率
    Pe1=0.5+0.5*erf((C_opt-s1)/(sqrt(2*sigma2(k))));
    Pe(k)=P0*Pe0 + P1*Pe1;
end
semilogy(A2_over_sigma2_dB, Pe);
xlabel('A^2 sigma&2(dB)');
ylabel('错误率P_e');
legend('仿真结果','理论曲线');
grid on;








