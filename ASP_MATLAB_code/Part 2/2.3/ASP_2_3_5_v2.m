clear all

load sunspot.dat
N = 288;

x = sunspot(1:N, 2);
m = mean(x);
s = std(x);
x = x - m;
x = x./s;

a1 = - aryule(x,1);
a2 = - aryule(x,2);
a10 = - aryule(x,10);
a1 = a1(2:2);
a2 = a2(2:3);
a10 = a10(2:11);


y2 = x;
for i = 12:288
    samples = x(i-11:i-10);
    for k = 1:10
        new = dot(a2,flip(samples));
        samples(1) = samples(2);
        samples(2) = new;
    end
    y2(i) = samples(2);
end


y10 = x;
for i = 20:288
    samples = x(i-19:i-10);
    for k = 1:10
        new = dot(a10,flip(samples));
        samples(1) = samples(2);
        samples(2) = samples(3);
        samples(3) = samples(4);
        samples(4) = samples(5);
        samples(5) = samples(6);
        samples(6) = samples(7);
        samples(7) = samples(8);
        samples(8) = samples(9);
        samples(9) = samples(10);
        samples(10) = new;
    end
    y10(i) = samples(10);
end
plot(y10)











