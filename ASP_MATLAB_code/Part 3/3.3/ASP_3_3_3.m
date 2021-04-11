clear all

clear all
load sunspot.dat

N = 288;

x = sunspot(1:N, 2);
m = mean(x);
s = std(x);

x = x - m;
x = x./s;

[c, lags] = xcorr(x, 'unbiased');

%figure;
%stem(lags, c, 'LineWidth', 2, 'MarkerSize', 1)
%xlim([-50, 50])
%xlabel('\tau')
%ylabel('R_X(\tau)')
%title(['ACF of Sunspots, N=' int2str(N)] )
%set(gca,'FontSize',16)
%grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rxx = c(288:length(c));

p = 2;

H = zeros(p,p);
H(1,1) = Rxx(1);
H(1,2) = Rxx(2);
H(2,1) = Rxx(2);
H(2,2) = Rxx(1);

xx = zeros(p,1);
xx(1) =  Rxx(2);
xx(2) =  Rxx(3);

a = inv(H) * xx;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rxx = c(288:length(c));
M = 10;


xx = Rxx(2:M+1);

H = Rxx(1:M);

a = inv(transpose(H)*H)*transpose(H)*xx;
disp('order 1')
display(a)


%%%%%%%%%
k = 10;
mdl = ones(k,1);
aic = ones(k,1);
aicc = ones(k,1);
err = ones(k,1);

y=x;
for i = 2:288
    y(i) = dot(a,flip(x(i-1:i-1)));
end
err(1) = immse(x,y) * N;
mdl(1) = log(err(1)) + 1*log(N)/N;
aic(1) = log(err(1)) + 2*1/N;
aicc(1) = aic(1) + 2*1*(1+1)/(N-1-1);

PSD = zeros(512,10);
a1 = [1; -a];
[M_PSD, w] = freqz(1, a1, 512);
PSD(:,1) = 10*log10((abs(M_PSD).^2));


for p = 2:10
    tmp = zeros(M,1);
    tmp(p:M) = Rxx(1:M-p+1);
    tmp(1:p-1) = flip(Rxx(2:p));
    
    Hnew = zeros(M,p);
    Hnew(:, 1:p-1) = H;
    Hnew(:,p) = tmp;
    
    H = Hnew;
    
    a = inv(transpose(H)*H)*transpose(H)*xx;
    display(['order ', num2str(p)])
    display(a)
    
    a1 = [1; -a];
    [M_PSD, w] = freqz(1, a1, 512);
    PSD(:,p) = 10*log10((abs(M_PSD).^2));
    
    
    if p == 2
        MSE = [];
        J = [];
        for j = 10:5:250
            y=x(1:j);
            for i = p+1:j
                y(i) = dot(a,flip(x(i-p:i-1)));
            end
            MSE = [MSE immse(x(1:j),y)];
            J = [J j];
        end
        figure
        plot(J, MSE)
        xlabel('N')
        ylabel('MSE')
        title('Approximation MSE vs. Data Length')
        set(gca,'FontSize',34)
        grid on
    end
    
    y=x;
    for i = p+1:288
        y(i) = dot(a,flip(x(i-p:i-1)));
    end
    err(p) = immse(x,y) * N;
    mdl(p) = log(err(p)) + p*log(N)/N;
    aic(p) = log(err(p)) + 2*p/N;
    aicc(p) = aic(p) + 2*p*(p+1)/(N-p-1);
    
end


figure
hold on

plot(w/(2*pi), PSD(:,1), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,2), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,3), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,4), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,5), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,6), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,7), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,8), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,9), 'linewidth', 1.5)
plot(w/(2*pi), PSD(:,10), 'linewidth', 1.5)


xlabel('Frequency')
ylabel('Magnitude (dB)')
legend('Order = 1', 'Order = 2', 'Order = 3', 'Order = 4', 'Order = 5', 'Order = 6', 'Order = 7', 'Order = 8', 'Order = 9', 'Order = 10', 'interpreter', 'latex')
title('Model Based PSD Estimates of Sunspot Series', 'interpreter', 'latex')
set(gca,'FontSize',24)
grid on



logerror = log(err);
figure
hold on
plot(logerror)
plot(mdl)
plot(aic)
plot(aicc)
legend('log(CSE)', 'MDL', 'AIC', 'AIC_c', 'Location','north')
xlabel('model order')
ylabel('error')
title('Error vs. AR model order')
set(gca,'FontSize',14)
grid on

















