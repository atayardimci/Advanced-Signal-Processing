clear all
x = rp3(100,100);
%x = transpose(x)

figure
y = mean(x)
plot(y)
xlabel('time')
ylabel('ensemble mean')
set(gca,'FontSize', 24)
title('Ensemble Mean of rp3', 'FontSize', 44)
grid on

figure
z = std(x)
plot(z)
xlabel('time')
ylabel('ensemble standard deviation')
set(gca,'FontSize', 24)
title('Ensemble Standard Deviation of rp3', 'FontSize', 44)
grid on

