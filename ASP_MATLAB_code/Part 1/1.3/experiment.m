clear all
x = randn(1,10^6);
figure
pdf(x)
hold on
z = (-5:0.1:5);
y = 1/sqrt(2*pi)*exp(-(z.^2)/2);
plot(z, y, 'LineWidth', 5)



