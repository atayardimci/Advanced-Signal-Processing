clear all

load RAW.mat

N = length(data);

x1 = data(7000:247800);
x2 = data(259100:500000);
x3 = data(535100:751200);

figure
plot(data)
xlabel('$\hat{h}[n]$','interpreter','latex')

figure
subplot(3,1,1)
plot(x1)
subplot(3,1,2)
plot(x2)
subplot(3,1,3)
plot(x3)


[c1, lags1] = xcorr(x1, 'unbiased');

plot(lags1, c1)
xlabel('\tau')
ylabel('Rx(\tau)')
title('ACF of Trial 1' )
set(gca,'FontSize',16)