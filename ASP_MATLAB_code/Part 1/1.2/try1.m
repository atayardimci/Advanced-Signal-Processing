clear all
N = 10;
M = 5;
x = sin((1:N)*pi/N)
mc = ones(M,1) * x
a=0.02;
b=5; 

Ac=a*ones(M,1)*[1:N]