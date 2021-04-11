clear all

load sunspot.dat
N = 288;

x = sunspot(1:N, 2);

m = mean(x);
s = std(x);

x = x - m;
x = x./s;


for i = 1:10
    a = aryule(x,i);
    display(-a)
end
