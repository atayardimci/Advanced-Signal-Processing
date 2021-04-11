clear all

load sunspot.dat
N = 288;

x = sunspot(1:N, 2);
m = mean(x);
s = std(x);
x = x - m;
x = x./s;


k = 10;
mdl = ones(k,1);
aic = ones(k,1);
aicc = ones(k,1);
err = ones(k,1);
for p = 1:k
    a = - aryule(x,p);
    a = a(2:p+1);
    y=x;
    for i = p+1:288
        y(i) = dot(a,flip(x(i-p:i-1)));
    end
    err(p) = immse(x,y) * N;
    mdl(p) = log(err(p)) + p*log(N)/N;
    aic(p) = log(err(p)) + 2*p/N;
    aicc(p) = aic(p) + 2*p*(p+1)/(N-p-1);
end

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


