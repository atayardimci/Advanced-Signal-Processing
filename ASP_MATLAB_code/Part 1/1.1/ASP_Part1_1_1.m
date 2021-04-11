clear all

x = rand(1, 1000);

figure
plot(x)
title('1000 Samples of X ~ U(0,1)', 'FontSize', 24)
ylim([-1 2])
xlabel('n')
ylabel('x[n]')
set(gca,'FontSize',20)

m = mean(x)
s = std(x)
