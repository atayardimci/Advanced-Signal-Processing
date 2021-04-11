%clear all

%w1 = randn(128,1);
%w2 = randn(256,1);
%w3 = randn(512,1);

x1 = w1;
x2 = w2;
x3 = w3;

y1 = pgm(x1);
a1 = (0:127) / 128;
y2 = pgm(x2);
a2 = (0:255) / 256;
y3 = pgm(x3);
a3 = (0:511) / 512;

b = 0.2 * [1 1 1 1 1];
a = 1;

y1 = filter(b, a, y1);
y2 = filter(b, a, y2);
y3 = filter(b, a, y3);

figure
subplot(3,1,1)
plot(a1, y1)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)


subplot(3,1,2)
plot(a2, y2)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 256 sample realisation of WGN')
set(gca,'FontSize',14)


subplot(3,1,3)
plot(a3, y3)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 256 sample realisation of WGN')
set(gca,'FontSize',14)


mean(y1)
mean(y2)
mean(y3)
