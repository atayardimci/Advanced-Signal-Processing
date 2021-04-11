clear all

load sunspot.dat
N = 288;

w = randn(N,1);
x = sunspot(1:N, 2);
m = mean(x);
s = std(x);



figure
subplot(2,2,1)
plot(x)

a = ar(x,2);
y = filter(1, a, w);
subplot(2,2,2)
plot(y)

x = x - m;
x = x./s;
subplot(2,2,3)
plot(x)

a1 = aryule(x,10);
y1 = filter(1, a1, w);
subplot(2,2,4)
plot(y1)







