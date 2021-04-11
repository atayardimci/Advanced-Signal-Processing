clear all

N = 10;
f0 = 0.49;

n = 0:N-1;

x = cos(2*pi*f0*n);

PGM = pgm(x);
a1 = (0:N-1) / N;

[pxx, w] = periodogram(x);

figure
plot(w./(2*pi),pxx)





figure
plot(a1, PGM,  'LineWidth', 0.8)
xlabel('Frequency')
ylabel('magnitude')
set(gca,'FontSize',34)
title(['$\hat{P}_X(f)$ of $\cos(2 \pi', num2str(f0), 'n)$ for N=10'], 'interpreter', 'latex','FontSize',46)
grid on
xlim([0 0.5])
