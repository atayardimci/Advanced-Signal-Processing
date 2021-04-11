clear all

[h w] = freqz(1, [1 0.9], 512);

plot(w, h)