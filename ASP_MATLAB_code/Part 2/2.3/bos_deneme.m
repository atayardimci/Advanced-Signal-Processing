clear all

load sunspot.dat
N = 288;

x = sunspot(1:N, 2);
m = mean(x);
s = std(x);
x = x - m;
x = x./s;

figure
subplot(2,2,1)
plot(x)


a = -aryule(x,1);
y=x;
for i = 2:288
    y(i) = a(2) * x(i-1);
end
subplot(2,2,2)
plot(y)
immse(x,y)

a = -aryule(x,2);
y=x;
for i = 3:288
    y(i) = a(2) * x(i-1) + a(3) * x(i-2);
end
subplot(2,2,3)
plot(y)
immse(x,y)

p = 10;
a = - aryule(x,p);
a = a(2:p+1);
y=x;
for i = p+1:288
    y(i) = dot(a,flip(x(i-p:i-1)));
end
subplot(2,2,4)
plot(y)
immse(x,y)





