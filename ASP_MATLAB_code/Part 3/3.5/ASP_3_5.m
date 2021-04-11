clear all

load RAW.mat

N = length(data);

x1 = data(7000:247800);
x2 = data(259100:500000);
x3 = data(535100:751200);

[xRRI1,fsRRI1]=ECG_to_RRI(x1,fs);
[xRRI2,fsRRI2]=ECG_to_RRI(x2,fs);
[xRRI3,fsRRI3]=ECG_to_RRI(x3,fs);

xRRI1 = detrend(xRRI1); 
xRRI2 = detrend(xRRI2); 
xRRI3 = detrend(xRRI3); 

T = 1/fsRRI1;
time1 = T:T:T*length(xRRI1);
time2 = T:T:T*length(xRRI2);
time3 = T:T:T*length(xRRI3);




%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot(time1, xRRI1)
title('RRI-1')

PGM1 = (pgm(xRRI1));
PGM1_a = (0:length(xRRI1)-1) / length(xRRI1);

figure
plot(PGM1_a, PGM1)
xlabel('Normalized Frequency')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of RRI - Trial 1')
set(gca,'FontSize',24)
grid on




figure
plot(time2, xRRI2)
title('RRI-2')

PGM2 = (pgm(xRRI2));
PGM2_a = (0:length(xRRI2)-1) / length(xRRI2);

figure
plot(PGM2_a, PGM2)
xlabel('Normalized Frequency')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of RRI - Trial 2')
set(gca,'FontSize',24)
grid on



figure
plot(time3, xRRI3)
title('RRI-3')

PGM3 = (pgm(xRRI3));
PGM3_a = (0:length(xRRI3)-1) / length(xRRI3);

figure
plot(PGM3_a, PGM3)
xlabel('Normalized Frequency')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('pgm of RRI - Trial 3')
set(gca,'FontSize',24)
grid on

%%%%%%%%%%%%%%%%

figure
spectrogram(xRRI1, hann(963), 0, [], 4, 'yaxis')
title('Spectrogram of RRI-1')
set(gca,'FontSize',24)

figure
spectrogram(xRRI2, hann(length(xRRI2)), 0, [], 4, 'yaxis')
title('Spectrogram of RRI-2')
set(gca,'FontSize',24)

figure
spectrogram(xRRI3, hann(length(xRRI3)), 0, [], 4, 'yaxis')
title('Spectrogram of RRI-3')
set(gca,'FontSize',24)





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 1

A_RRI1_1 = xRRI1(1:160);
A_RRI1_2 = xRRI1(161:320);
A_RRI1_3 = xRRI1(321:480);
A_RRI1_4 = xRRI1(481:640);
A_RRI1_5 = xRRI1(641:800);
A_RRI1_6 = xRRI1(801:960);

R1A1_a = (0:159) / 160;

A1 = pgm(A_RRI1_1);
A2 = pgm(A_RRI1_2);
A3 = pgm(A_RRI1_3);
A4 = pgm(A_RRI1_4);
A5 = pgm(A_RRI1_5);
A6 = pgm(A_RRI1_6);

R1A1 = (A1 + A2 + A3 + A4 + A5 + A6)/6;

figure
plot(R1A1_a, R1A1)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('RRI Trial 1 Averaged Periodogram Window Length = 40s')
set(gca,'FontSize',24)
grid on


A_RRI1_1 = xRRI1(1:320);
A_RRI1_2 = xRRI1(321:640);
A_RRI1_3 = xRRI1(641:960);

R1A2_a = (0:319) / 320;

A1 = pgm(A_RRI1_1);
A2 = pgm(A_RRI1_2);
A3 = pgm(A_RRI1_3);

R1A2 = (A1 + A2 + A3)/3;

figure
plot(R1A2_a, R1A2)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('RRI Trial 1 Averaged Periodogram Window Length = 80s')
set(gca,'FontSize',24)
grid on

%%%%%%%% 2


A_RRI1_1 = xRRI2(1:160);
A_RRI1_2 = xRRI2(161:320);
A_RRI1_3 = xRRI2(321:480);
A_RRI1_4 = xRRI2(481:640);
A_RRI1_5 = xRRI2(641:800);
A_RRI1_6 = xRRI2(801:960);

R2A1_a = (0:159) / 160;

A1 = pgm(A_RRI1_1);
A2 = pgm(A_RRI1_2);
A3 = pgm(A_RRI1_3);
A4 = pgm(A_RRI1_4);
A5 = pgm(A_RRI1_5);
A6 = pgm(A_RRI1_6);

R2A1 = (A1 + A2 + A3 + A4 + A5 + A6)/6;

figure
plot(R2A1_a, R2A1_a)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('RRI Trial 2 Averaged Periodogram Window Length = 40s')
set(gca,'FontSize',24)
grid on


A_RRI1_1 = xRRI2(1:320);
A_RRI1_2 = xRRI2(321:640);
A_RRI1_3 = xRRI2(641:960);

R2A2_a = (0:319) / 320;

A1 = pgm(A_RRI1_1);
A2 = pgm(A_RRI1_2);
A3 = pgm(A_RRI1_3);

R2A2 = (A1 + A2 + A3)/3;

figure
plot(R2A2_a, R2A2)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('RRI Trial 2 Averaged Periodogram Window Length = 80s')
set(gca,'FontSize',24)
grid on

%%%%%%%% 3



A_RRI1_1 = xRRI3(1:120);
A_RRI1_2 = xRRI3(121:240);
A_RRI1_3 = xRRI3(241:360);
A_RRI1_4 = xRRI3(361:480);
A_RRI1_5 = xRRI3(481:600);
A_RRI1_6 = xRRI3(601:720);
A_RRI1_7 = xRRI3(721:840);

R3A1_a = (0:119) / 120;

A1 = pgm(A_RRI1_1);
A2 = pgm(A_RRI1_2);
A3 = pgm(A_RRI1_3);
A4 = pgm(A_RRI1_4);
A5 = pgm(A_RRI1_5);
A6 = pgm(A_RRI1_6);
A7 = pgm(A_RRI1_7);

R3A1 = (A1 + A2 + A3 + A4 + A5 + A6 + A7)/7;

figure
plot(R3A1_a, R3A1)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('RRI Trial 3 Averaged Periodogram Window Length = 30s')
set(gca,'FontSize',24)
grid on


A_RRI1_1 = xRRI3(1:280);
A_RRI1_2 = xRRI3(281:560);
A_RRI1_3 = xRRI3(561:840);

R3A2_a = (0:279) / 280;

A1 = pgm(A_RRI1_1);
A2 = pgm(A_RRI1_2);
A3 = pgm(A_RRI1_3);

R3A2 = (A1 + A2 + A3)/3;

figure
plot(R3A2_a, R3A2)
xlabel('f')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
title('RRI Trial 3 Averaged Periodogram Window Length = 70s')
set(gca,'FontSize',24)
grid on




%%%%%%%%%% final figures

figure
hold on
plot(PGM1_a, PGM1, 'LineWidth', 1)
plot(R1A1_a, R1A1, 'LineWidth', 1)
plot(R1A2_a, R1A2, 'LineWidth', 1)

xlabel('Normalized Frequency')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
legend('Standard PGM', 'Averaged PGM - Window Length = 40s', 'Averaged PGM - Window Length = 80s')
set(gca,'FontSize',30)
title('PSD Estimation of RRI data for Trial 1', 'FontSize',40)
grid on
xlim([0 0.2])


figure
hold on
plot(PGM2_a, PGM2, 'LineWidth', 1)
plot(R2A1_a, R2A1, 'LineWidth', 1)
plot(R2A2_a, R2A2, 'LineWidth', 1)

xlabel('Normalized Frequency')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
legend('Standard PGM', 'Averaged PGM - Window Length = 40s', 'Averaged PGM - Window Length = 80s')
set(gca,'FontSize',30)
title('PSD Estimation of RRI data for Trial 2', 'FontSize',40)
grid on
xlim([0 0.2])


figure
hold on
plot(PGM3_a, PGM3, 'LineWidth', 1)
plot(R3A1_a, R3A1, 'LineWidth', 1)
plot(R3A2_a, R3A2, 'LineWidth', 1)

xlabel('Normalized Frequency')
ylabel('$\hat{P}_X(f)$', 'interpreter', 'latex')
legend('Standard PGM', 'Averaged PGM - Window Length = 30s', 'Averaged PGM - Window Length = 70s')
set(gca,'FontSize',30)
title('PSD Estimation of RRI data for Trial 3', 'FontSize',40)
grid on
xlim([0 0.2])




