clear all

x = randn(1, 1000);

figure
plot(x)
title('1000 Samples of X ~ N(0,1)', 'FontSize', 24)
xlabel('n', 'FontSize', 20)
ylabel('x[n]', 'FontSize', 20)
set(gca,'FontSize',20)

m = mean(x)
s = std(x)