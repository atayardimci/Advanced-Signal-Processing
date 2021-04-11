clear all



[y_e,~] = audioread('e.m4a');
[y_a,~] = audioread('a.m4a');
[y_s,~] = audioread('s.m4a');
[y_t,~] = audioread('t.m4a');
[y_x,Fs] = audioread('x.m4a');

%figure
%plot(y_x)

sound(y_x,Fs);

N = 1000;

x_e = y_e(18001:19000);
x_a = y_a(19501:20500);
x_s = y_s(21001:22000);
x_t = y_t(15001:16000);
x_x = y_x(14601:15600);

x_e2 = y_e(17001:22000);

%figure
%plot(x_x)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%N = 5000;
x = zeros(N,1);
x(1:N) = x_x(1:N);

p = 2;

[a, e] = aryule(x,p)
%w = -a(2:p+1);
%w = transpose(w)./2;

mu_init = 2;
mu = mu_init;


w = zeros(p, 1);
W = zeros(p, p);

xhat = zeros(N, 1);
e = zeros(N, 1);
for n = p+1:N
    
    x_tmp = flip(x(n-p:n-1));
    xhat(n) = dot(w, x_tmp);
    
    e(n) = x(n) - xhat(n);
    
    mu_tmp = mu / (dot(x_tmp,x_tmp) + 0.001);
    %mu_tmp = mu;
    
    w = w + x_tmp.* (mu_tmp * e(n));
    W = [W w];
    
    decay_rate = 0.995;
    mu = mu * decay_rate;
end

Rp = 20*log10(std(x)/std(e));


figure
hold on
plot(W(1,:), 'LineWidth', 1)
plot(W(2,:), 'LineWidth', 1)
%plot(W(3,:), 'LineWidth', 1)
%plot(W(4,:), 'LineWidth', 1)
%plot(W(5,:), 'LineWidth', 1)
%plot(W(6,:), 'LineWidth', 1)


legend('a_1', 'a_2', 'a_3', 'a_4', 'a_5', 'a_6', 'a_7', 'a_8', 'a_9')

ylabel('weigths')
xlabel('time n')
%yticks(-1.2:0.1:0.2)
%ylim([-1.2 0.2])
grid on
set(gca,'FontSize',24)
title(['"x", Rp = ', num2str(Rp), ' - Evolution of Coefficients with \mu = ', num2str(mu_init), ' and decay rate = ', num2str(decay_rate)])
xlim([0 N])



figure
plot(e.^2)
ylabel('Error Power')
xlabel('time n')
grid on
set(gca,'FontSize',24)
title(['"x" Time Evolution of e^2(n) with \mu = ', num2str(mu_init), ' and order = ', num2str(p)])
















