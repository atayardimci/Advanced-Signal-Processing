clear all
num_bins = 100;
num_samples = 10^8;
x = randn(1, num_samples);

figure
h = histogram(x, num_bins, 'Normalization', 'pdf');
hold on
z = (-5:0.1:5);
y = 1/sqrt(2*pi)*exp(-(z.^2)/2);
plot(z, y)
xlabel('x', 'FontSize', 20)
ylabel('pdf(x)', 'FontSize', 20)
title('pdf of X', 'FontSize', 24)
set(gca,'FontSize',20)