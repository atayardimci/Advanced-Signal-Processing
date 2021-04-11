clear all
rng(1)
x = randn(1,1000);

[c, lags] = xcorr(x, 'unbiased')

figure
plot(lags, c)
xlabel('\tau')
ylabel('Rx(\tau)')
set(gca,'FontSize',24)
title('ACF of 1000 Sample WGN (zoomed in)', 'FontSize',44)
grid on
xlim([-50 50])

