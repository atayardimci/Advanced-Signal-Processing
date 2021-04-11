clear all

load RAW.mat

x1 = data(7000:247800);
x2 = data(259100:500000);
x3 = data(535100:751200);

[xRRI,fsRRI]=ECG_to_RRI(x1,fs);

h = (xRRI.^-1) * 60;

a = 0.6;

N = length(h);
newN = floor(N/10);
hhat = zeros(newN,1);
N = newN *10;
for i= 1:10:N
    tmp = h(i:i+9);
    index = floor(i/10) + 1;
    hhat(index) = mean(tmp) * a;
end

figure
plot(h)
title('h')
figure
plot(hhat)
title('hhat')




[f1, xi1] = ksdensity(h);
[f2, xi2] = ksdensity(hhat);

figure
hold on
plot(xi1, f1)
plot(xi2, f2)
legend('$h[n]$', '$\hat{h}[n]$', 'Interpreter', 'latex')
xlabel('Heart Rate (bpm)')
ylabel('Probability Density Estimate')
title('PDEs of $h[n]$ and $\hat{h}[n]$ for $\alpha = 0.6$', 'interpreter','latex')
set(gca,'FontSize',14)
grid on











