% maximum likelihood estimation
% mle_prj.m

d=410;   % number of bits of error
n=90*10; % total number of bits sent
k=n-d;   % not in error
q=0:0.002:1; 
y=binopdf(k,n,q);
plot(q,y);
xlabel('Probability q');
ylabel('Likelihood');
title('Maximum likelihood estimation');
[maxY, maxIndex]=max(y);
disp(sprintf('MLE of q is %f',q(maxIndex)));




