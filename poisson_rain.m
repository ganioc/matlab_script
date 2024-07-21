% poisson_rain.m

p=input('input p=')
n=input('input n=')
lambda = n*p;
for k=1:9
    p_k(k)=poisspdf(k-1,lambda);
end

p_k
