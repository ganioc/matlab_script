%bino_2.m

observed=1:1000;
trials=observed*2;
figure;
alpha=0.05;
[phat, pci]=binofit(observed, trials, alpha);
plot(trials, phat, '-b');
hold on;
plot(trials, pci(:,1), '-g');
plot(trials, pci(:, 2), '-r');

alpha=0.01;
[phat, pci]=binofit(observed,trials, alpha);
plot(trials, phat, '-b');
plot(trials, pci(:,1), ':g');
plot(trials, pci(:,2), 'r');
alpha=0.001;
[phat, pci]=binofit(observed, trials, alpha);
plot(trials, phat, ':b');
plot(trials, pci(:,1), ':g');
plot(trials, pci(:, 2), ':r');

