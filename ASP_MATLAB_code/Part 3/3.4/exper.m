clear all

t = 0:0.001:3;
x = chirp(t,100,1,200,'quadratic');

spectrogram(x,128,120,128,1e3)