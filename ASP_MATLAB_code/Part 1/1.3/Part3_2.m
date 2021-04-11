clear all

a = linspace(-1,2,100);
y = ones(1, length(a))./3;

figure
subplot(2,2,1)
x = rp3(1,100);
pdf(x)
hold on
plot(a,y,'LineWidth', 2, 'color', 'r')

subplot(2,2,2)
x = rp3(1,10^3);
pdf(x)
hold on
plot(a,y,'LineWidth', 2, 'color', 'r')

subplot(2,2,3)
x = rp3(1,10^4);
pdf(x)
hold on
plot(a,y,'LineWidth', 2, 'color', 'r')

subplot(2,2,4)
x = rp3(1,10^8);
pdf(x)
hold on
plot(a,y,'LineWidth', 2, 'color', 'r')




