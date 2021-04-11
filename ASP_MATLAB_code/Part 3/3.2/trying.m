clear all

x = randn(500,1);

figure
plot(x)

[acf, lags] = xcorr(x, 'unbiased');

figure
plot(lags, acf)

[acf, lags] = xcorr(x);

figure
plot(lags, acf)

