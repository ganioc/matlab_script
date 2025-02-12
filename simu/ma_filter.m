% moving average filter.m
% The M must be an odd number in order to realize the filter,

M=51; % Number of taps/points in the MA filter

data = [zeros(1,1000), 5*ones(1,3000),zeros(1,1000)]; % 5000 points 
    % sample data
noise = 2*rand(1,5000) - 1;
x = data + noise; % adding noise to data

% Plot the input

figure;
plot(x);
xlabel('Samples');
ylabel('Amplitude');
title('Input to the M-point Moving Average Filter');

% Compute the output response of the given moving average filter
figure;
y=zeros(1,5000);
for i=(M-1)/2+1:length(data)-(M-1)/2
    y(i)=0;
    for k=-(M-1)/2:(M-1)/2
        y(i)=y(i)+x(i+k);
    end
    y(i)=y(i)/M;
end
plot(y);
xlabel('Samples');
ylabel('Amplitude');
title(['Filtered output of the ',num2str(M),'-point Moving Average Filter']);

% Frequency response for varous filter length
colors = ['r', 'b', 'k', 'g']; % to plot in differnt colors
colorIndex = 1;

figure;
M = [3,11,51, 101];
for i=M
    b=repmat(1/i,1,i);
    a=1; % since this is a FIR filter a=1 and b=[1/M, 1/M, 1/M,... repeated
        % M times]
    [h,w] = freqz(b,a); % using the Freqz function to get the frequenc resp
    h=abs(h);
    w=w/max(w);
    plot(w,h,colors(colorIndex)); % Plotting the response
    colorIndex = colorIndex + 1;
    hold on;
end
hold off;

legend('M=3','M=11', 'M=51', 'M=101');
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency response of M-point Moving Average Filter');








