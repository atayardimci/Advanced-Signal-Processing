clear all

x = randn(1000,1);

b = [1 2 3 2 1];
a = 1;

y = filter(b, a, x);

factor = std(y);
%y = y - mean(y);
y = y./factor;

n_var = 10;
sigma = sqrt(n_var);
eta = randn(1000,1).* sigma;

z = y + eta;

[ccf, lags1] = xcorr(z,x, 'unbiased');
figure
plot(lags1, ccf)

[acf, lags2] = xcorr(x, 'unbiased');
figure
plot(lags2, acf)

ccf_short = ccf(1000:end);
acf_short = acf(1000:end);


pxx = zeros(5,1);
pxx(1:5) = ccf_short(1:5);


Rxx = zeros(5,5);
Rxx(1,:) = acf_short(1:5);

Rxx(2,2:5) = acf_short(1:4);
Rxx(2,1) = acf_short(2);

Rxx(3,3:5) = acf_short(1:3);
Rxx(3,1:2) = flip(acf_short(2:3));

Rxx(4,4:5) = acf_short(1:2);
Rxx(4,1:3) = flip(acf_short(2:4));

Rxx(5,5) = acf_short(1);
Rxx(5,1:4) = flip(acf_short(2:5));


w = inv(Rxx) * pxx
w = w * factor




