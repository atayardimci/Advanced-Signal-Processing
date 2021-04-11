clear all

load sunspot.dat
N = 288;

x = sunspot(1:N, 2);

%figure
%plot(x)
xlabel('n')
ylabel('x[n]')
title('Sunspot Series')
set(gca,'FontSize',24)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PGM = pgm(x);
PGM1 = 10*log10(PGM);
a1 = (0:287) / 288;

[a, e, rc] = aryule(x,1);
[M_PSD1, w1] = freqz(1, a, 512);
PSD1 = 10*log10(e * (abs(M_PSD1).^2));

[a, e, rc] = aryule(x,2);
[M_PSD2, w2] = freqz(1, a, 512);
PSD2 = 10*log10(e * (abs(M_PSD2).^2));

[a, e, rc] = aryule(x,5);
[M_PSD5, w5] = freqz(1, a, 512);
PSD5 = 10*log10(e * (abs(M_PSD5).^2));

[a, e, rc] = aryule(x,10);
[M_PSD10, w10] = freqz(1, a, 512);
PSD10 = 10*log10(e * (abs(M_PSD10).^2));




figure
hold on

plot(a1, PGM1,  'LineWidth', 1)
%plot(w1/(2*pi), PSD1, 'linewidth', 0.8)
plot(w2/(2*pi), PSD2, 'linewidth', 1.5)
plot(w5/(2*pi), PSD5, 'linewidth', 1.5)
plot(w10/(2*pi), PSD10, 'linewidth', 1.5)

xlim([0 0.5])


xlabel('Frequency')
ylabel('Magnitude (dB)')
legend('$PGM$', 'Order = 2', 'Order = 5', 'Order = 10', 'interpreter', 'latex')
title('PGM and Model Based PSD Estimates of Sunspot Series', 'interpreter', 'latex')
set(gca,'FontSize',24)
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
















