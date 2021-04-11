clear all
x1 = randn(128,1);
x2 = randn(256,1);
x3 = randn(512,1);

y1 = pgm(x1);
a1 = (0:127) / 128;
y2 = pgm(x2);
a2 = (0:255) / 256;
y3 = pgm(x3);
a3 = (0:511) / 512;

[pxx1, w1] = periodogram(x1);
[pxx2, w2] = periodogram(x2);
[pxx3, w3] = periodogram(x3);

figure
subplot(3,1,1)
plot(a1, y1)
hold on
plot(w1/(2*pi), pxx1)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)


subplot(3,1,2)
plot(a2, y2)
hold on
plot(w2/(2*pi), pxx2)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 256 sample realisation of WGN')
set(gca,'FontSize',14)


subplot(3,1,3)
plot(a3, y3)
hold on
plot(w3/(2*pi), pxx3)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 256 sample realisation of WGN')
set(gca,'FontSize',14)


mean(y1)
mean(y2)
mean(y3)
