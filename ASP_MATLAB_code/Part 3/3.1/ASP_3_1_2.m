clear all
w = randn(1024,1);

w1 = w(1:128);
w2 = w(129:256);
w3 = w(257:384);
w4 = w(385:512);
w5 = w(513:640);
w6 = w(641:768);
w7 = w(769:896);
w8 = w(897:1024);

a1 = (0:127) / 128;

y1 = pgm(w1);
y2 = pgm(w2);
y3 = pgm(w3);
y4 = pgm(w4);
y5 = pgm(w5);
y6 = pgm(w6);
y7 = pgm(w7);
y8 = pgm(w8);



figure
subplot(4,2,1)
plot(a1, y1)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

subplot(4,2,2)
plot(a1, y2)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

subplot(4,2,3)
plot(a1, y3)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

subplot(4,2,4)
plot(a1, y4)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

subplot(4,2,5)
plot(a1, y5)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

subplot(4,2,6)
plot(a1, y6)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

subplot(4,2,7)
plot(a1, y7)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

subplot(4,2,8)
plot(a1, y8)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of 128 sample realisation of WGN')
set(gca,'FontSize',14)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = (y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8)/8;

figure
plot(a1, y)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('Averaged Periodogram')
set(gca,'FontSize',14)







