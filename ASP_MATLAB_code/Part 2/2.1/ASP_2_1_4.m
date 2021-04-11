clear all


x = randn(1,1000);
y = filter(ones(15,1),(1),x);

%plot(y)

[c, lags] = xcorr(y, 'unbiased')

figure
stem(lags, c)
set(gca,'FontSize', 28)
xlabel('\tau', 'FontSize', 44)
ylabel('Rx(\tau)', 'FontSize', 36)
title('ACF estimate of filtered WGN', 'FontSize', 44)
grid on
xlim([-20 20])

%figure
%plot(lags, c)

