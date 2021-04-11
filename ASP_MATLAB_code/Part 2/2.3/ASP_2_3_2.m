clear all
load sunspot.dat

N = 250;

x = sunspot(1:N, 2);
m = mean(x);
s = std(x);

%x = x - m;
%x = x./s;

[c, lags] = xcorr(x, 'unbiased');

figure;
stem(lags, c, 'LineWidth', 2, 'MarkerSize', 1)
xlim([-50, 50])
xlabel('\tau')
ylabel('R_X(\tau)')
title(['ACF of Sunspots, N=' int2str(N)] )
set(gca,'FontSize',16)
grid on
