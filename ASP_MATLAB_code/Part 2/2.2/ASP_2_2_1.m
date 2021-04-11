clear all
x = randn(1,1000);
y = filter(ones(9,1),(1),x);


[c, lags] = xcorr(y, x, 'unbiased')
[z, lags1] = xcorr(x, 'unbiased')

figure

stem(lags, c)
title('CCF estimate of X and Y' )
xlabel('\tau')
ylabel('R_{XY}(\tau)')
set(gca,'FontSize',16)
xlim([-20 20])

figure
stem(lags1, z)
title('ACF estimate of X' )
xlabel('\tau')
ylabel('R_{X}(\tau)')
set(gca,'FontSize',16)
xlim([-20 20])
