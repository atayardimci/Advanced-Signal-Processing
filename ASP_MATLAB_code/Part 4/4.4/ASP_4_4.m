clear all

rng(1)

N = 3000;
eta = randn(N,1);

b = 1;
a = [1 0.9 0.2];

x = filter(b, a, eta);

mu_init = 0.025;
mu = mu_init;

p = 2;
w = zeros(p, 1);
W = zeros(p, p);

xhat = zeros(N, 1);
e = zeros(N, 1);
for n = p+1:N
    
    x_tmp = flip(x(n-2:n-1));
    xhat(n) = dot(w, x_tmp);
    
    e(n) = x(n) - xhat(n);
    
    mu_tmp = mu / (dot(x_tmp,x_tmp) + 0.001);
    %mu_tmp = mu;
    
    w = w + x_tmp.* (mu_tmp * e(n));
    W = [W w];
    
    decay_rate = 0.998;
    mu = mu * decay_rate;
end


figure
hold on
plot(W(1,:), 'LineWidth', 1)
plot(W(2,:), 'LineWidth', 1)

legend('a_1', 'a_2')
ylabel('weigths')
xlabel('time n')
yticks(-1.2:0.1:0.2)
ylim([-1.2 0.2])
grid on
set(gca,'FontSize',24)
title(['Time Evolution of the Coefficients with \mu = ', num2str(mu_init), ' and decay rate = ', num2str(decay_rate)])
xlim([0 N])