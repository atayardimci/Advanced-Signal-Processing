clear all

x = rand(1000, 10);
m = mean(x)
s = std(x)

figure
plot(m, '*', 'MarkerSize', 10)
xlabel('realisation')
ylabel('mean')
set(gca,'FontSize', 24)
title('Means of Ten Realizations', 'FontSize', 36)
hold on
y = ones(1, length(m)).* 0.5;
plot(y)

figure
plot(s, '*', 'MarkerSize', 10)
xlabel('realisation')
ylabel('standard deviation')
set(gca,'FontSize', 24)
title('Standard Deviations of Ten Realizations', 'FontSize', 36)
hold on
y = ones(1, length(s)).* 0.289;
plot(y)