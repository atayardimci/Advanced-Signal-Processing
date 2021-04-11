clear all

x = randn(1064,1);

b = 1;
a = [1,0.9];

tmp = filter(b, a, x);
y = tmp(41:1064);

figure
subplot(2,1,1)
plot(x)
xlabel('n')
ylabel('x[n]')
title('Noisy Input')
set(gca,'FontSize',24)
xlim([0 1064]);

subplot(2,1,2)
plot(y)
xlabel('n')
ylabel('y[n]')
title('Filtered signal')
set(gca,'FontSize',24)
xlim([0 1064])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[h,w] = freqz(b, a, 512);

PGM = pgm(y);
a1 = (0:1023) / 1024;


figure
hold on
plot(w/(2*pi), abs(h).^2, 'LineWidth', 2.5)
plot(a1, PGM,  'LineWidth', 0.8, 'color', 'r')


xlabel('Frequency')
ylabel('magnitude')
legend('$P_Y(f)$', '$\hat{P}_Y(f)$', 'interpreter', 'latex')
title('$P_Y(f)$ and $\hat{P}_Y(f)$ (pgm)', 'interpreter', 'latex')
set(gca,'FontSize',24)
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% dB plot

PGM1 = 10*log10(PGM);
PSD1 = 10*log10((abs(h).^2));

figure
hold on
plot(w/(2*pi), PSD1, 'LineWidth', 2.5)
plot(a1, PGM1,  'LineWidth', 0.8, 'color', 'r')
%plot(w2/(2*pi), pxx)

xlabel('Frequency')
ylabel('Magnitude (dB)')
legend('$P_Y(f)$', '$\hat{P}_Y(f)$', 'interpreter', 'latex')
title('$P_Y(f)$ and $\hat{P}_Y(f)$ (pgm)', 'interpreter', 'latex')
set(gca,'FontSize',24)
grid on





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
[Ry, lags] = xcorr(y, 'unbiased');
plot(lags, Ry)



a1hat = Ry(1025)/Ry(1024)
sigma2x = Ry(1024) - a1hat * Ry(1025)


[MPSD, w3] = freqz(1, [1 -a1hat], 512);

figure
plot(w3/(2*pi), abs(MPSD).^2, 'linewidth', 2)
xlabel('Frequency')
ylabel('magnitude')
title('Model based $P_Y(f)$ estimate', 'interpreter', 'latex')
set(gca,'FontSize',24)
grid on



PSD2 = 10*log10((abs(MPSD).^2));

figure
plot(w3/(2*pi), PSD2, 'linewidth', 2)
xlabel('Frequency')
ylabel('Magnitude (db)')
title('Model based $P_Y(f)$ estimate', 'interpreter', 'latex')
set(gca,'FontSize',24)
grid on












