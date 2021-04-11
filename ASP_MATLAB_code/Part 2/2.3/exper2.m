clear all

load sunspot.dat
N = 288;

x = sunspot(1:N, 2);
w = randn(N,1);

x1 = x - mean(x);
x1 = x1./std(x1);

%1 = filter(1, [1 -0.5 0.3], w);

c1 = aryule(x1, 1);
c2 = aryule(x1, 2);
c3 = aryule(x1, 3);
c4 = aryule(x1, 4);
c5 = aryule(x1, 5);
c6 = aryule(x1, 6);
c7 = aryule(x1, 7);
c8 = aryule(x1, 8);
c9 = aryule(x1, 9);
c10 = aryule(x1, 10);

y1 = filter(1, c1, w);
y2 = filter(1, c2, w);
y3 = filter(1, c3, w);
y4 = filter(1, c4, w);
y5 = filter(1, c5, w);
y6 = filter(1, c6, w);
y7 = filter(1, c7, w);
y8 = filter(1, c8, w);
y9 = filter(1, c9, w);
y10= filter(1, c10, w);

e1 = x1 - y1;
e2 = x1 - y2;
e3 = x1 - y3;
e4 = x1 - y4;
e5 = x1 - y5;
e6 = x1 - y6;
e7 = x1 - y7;
e8 = x1 - y8;
e9 = x1 - y9;
e10 = x1 - y10;

subplot(2,2,1)
plot(x1)
subplot(2,2,2)
plot(e1)
subplot(2,2,3)
plot(e2)
subplot(2,2,4)
plot(e10)

err = ones(10, 1);

err(1) = immse(x1,y1);
err(2) = immse(x1,y2);
err(3) = immse(x1,y3);
err(4) = immse(x1,y4);
err(5) = immse(x1,y5);
err(6) = immse(x1,y6);
err(7) = immse(x1,y7);
err(8) = immse(x1,y8);
err(9) = immse(x1,y9);
err(10) = immse(x1,y10);

figure
plot(err)






