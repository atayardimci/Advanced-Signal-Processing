clear all

load RAW.mat

N = length(data);

x1 = data(7000:247800);
x2 = data(259100:500000);
x3 = data(535100:751200);

[xRRI1,fsRRI1]=ECG_to_RRI(x1,fs);
[xRRI2,fsRRI2]=ECG_to_RRI(x2,fs);
[xRRI3,fsRRI3]=ECG_to_RRI(x3,fs);

y1 = detrend(xRRI1); 
y2 = detrend(xRRI2); 
y3 = detrend(xRRI3); 

[c1, lags1] = xcorr(y1, 'unbiased');
[c2, lags2] = xcorr(y2, 'unbiased');
[c3, lags3] = xcorr(y3, 'unbiased');

figure
subplot(3,1,1)
plot(lags1, c1)
xlabel('\tau')
ylabel('Rx(\tau)')
title('ACF of Trial 1')
set(gca,'FontSize',16)
ylim([-2*10^-3 3*10^-3])

subplot(3,1,2)
plot(lags2, c2)
xlabel('\tau')
ylabel('Rx(\tau)')
title('ACF of Trial 2')
set(gca,'FontSize',16)
ylim([-2*10^-3 3*10^-3])

subplot(3,1,3)
plot(lags3, c3)
xlabel('\tau')
ylabel('Rx(\tau)')
title('ACF of Trial 3')
set(gca,'FontSize',16)
ylim([-2*10^-3 3*10^-3])






