clear all

rng(1)

x = randn(1000,1);

b = [1 2 3 2 1];
a = 1;

y = filter(b, a, x);

n_var = 0.01;
sigma = sqrt(n_var);
eta = randn(1000,1).* sigma;

z = y + eta;

mu = 0.5;
p = 5;


[yhat, e, W] = lms(x, z, mu, p);


figure
hold on
plot(W(1,:), 'LineWidth', 1)
plot(W(2,:), 'LineWidth', 1)
plot(W(3,:), 'LineWidth', 1)
plot(W(4,:), 'LineWidth', 1)
plot(W(5,:), 'LineWidth', 1)

legend('b_1', 'b_2', 'b_3', 'b_4', 'b_5', 'Location','south','NumColumns',5')
ylabel('weigths')
xlabel('time n')
grid on
set(gca,'FontSize',30)
title('Time Evolution of the Coefficients with Normalised Least Mean Square (NLMS)')
xlim([0 1000])


figure
plot(e.^2)
ylabel('Error Power')
xlabel('time n')
grid on
set(gca,'FontSize',30)
title(['Time Evolution of e^2(n) with \mu = ' num2str(mu)])



