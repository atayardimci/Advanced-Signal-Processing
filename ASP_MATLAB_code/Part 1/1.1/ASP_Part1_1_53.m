clear all

x = randn(1000, 10);
m = mean(x)
s = std(x)

figure
plot(m, '.', 'MarkerSize', 20)
xlabel('realisation')
ylabel('mean')
set(gca,'FontSize', 24)
title('Means of Ten Realisations', 'FontSize', 36)
hold on
z = zeros(1,10);
y = (1:10);
plot(y,z)



figure
plot(s, '.', 'MarkerSize', 20)
xlabel('realisation')
ylabel('standard deviation')
set(gca,'FontSize', 24)
title('Standard Deviations of Ten Realizations', 'FontSize', 36)
hold on
z = ones(1,10);
y = (1:10);
plot(y,z)