clear all

x = randn(1000,1);

b = [1 2 3 2 1];
a = 1;

y = filter(b, a, x);

factor = std(y);
%y = y - mean(y);
y = y./factor;

n_var = 0.01;
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



%%%%%%%%% Nw = 5
pxx = zeros(6,1);
pxx(1:6) = ccf_short(1:6);


Rxx = zeros(6,6);
Rxx(1,:) = acf_short(1:6);

Rxx(2,2:6) = acf_short(1:5);
Rxx(2,1) = acf_short(2);

Rxx(3,3:6) = acf_short(1:4);
Rxx(3,1:2) = flip(acf_short(2:3));

Rxx(4,4:6) = acf_short(1:3);
Rxx(4,1:3) = flip(acf_short(2:4));

Rxx(5,5:6) = acf_short(1:2);
Rxx(5,1:4) = flip(acf_short(2:5));

Rxx(6,6) = acf_short(1);
Rxx(6,1:5) = flip(acf_short(2:6));

w = inv(Rxx) * pxx
w = w * factor


%%%%%%%%% Nw = 6
pxx = zeros(7,1);
pxx(1:7) = ccf_short(1:7);


Rxx = zeros(7,7);
Rxx(1,:) = acf_short(1:7);

Rxx(2,2:7) = acf_short(1:6);
Rxx(2,1) = acf_short(2);

Rxx(3,3:7) = acf_short(1:5);
Rxx(3,1:2) = flip(acf_short(2:3));

Rxx(4,4:7) = acf_short(1:4);
Rxx(4,1:3) = flip(acf_short(2:4));

Rxx(5,5:7) = acf_short(1:3);
Rxx(5,1:4) = flip(acf_short(2:5));

Rxx(6,6:7) = acf_short(1:2);
Rxx(6,1:5) = flip(acf_short(2:6));

Rxx(7,7) = acf_short(1);
Rxx(7,1:6) = flip(acf_short(2:7));

w = inv(Rxx) * pxx
w = w * factor















