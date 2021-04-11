clear all


[y_e,~] = audioread('e16.m4a');
[y_a,~] = audioread('a16.m4a');
[y_s,~] = audioread('s16.m4a');
[y_t,~] = audioread('t16.m4a');
[y_x,Fs] = audioread('x16.m4a');

%sound(y_e,Fs);

N = 1000;

x_e = y_e(6701:7700);
x_a = y_a(5001:6000);
x_s = y_s(9501:10500);
x_t = y_t(5201:6200);
x_x = y_x(3601:4600);



%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = zeros(N,1);
x(1:N) = x_x(1:N);

mu_init = 0.5;
%mu = mu_init;

output = zeros(N,10);

k = 10;
mdl = ones(k,1);
aic = ones(k,1);
aicc = ones(k,1);
err = ones(k,1);
Rp = zeros(k,1);
for p = 1:k
    w = zeros(p, 1);
    W = zeros(p, p);
    
    mu = mu_init;

    xhat = zeros(N, 1);
    e = zeros(N, 1);
    for n = p+1:N
    
        x_tmp = flip(x(n-p:n-1));
        xhat(n) = dot(w, x_tmp);
    
        e(n) = x(n) - xhat(n);
    
        mu_tmp = mu / (dot(x_tmp,x_tmp) + 0.001);
    
        w = w + x_tmp.* (mu_tmp * e(n));
        W = [W w];
    
        decay_rate = 0.998;
        mu = mu * decay_rate;
    end
    
    Rp(p) = 20*log10(std(x)/std(e));
    
    y=x;
    for i = p+1:N
        y(i) = dot(w,flip(x(i-p:i-1)));
    end
    err(p) = immse(x,y) * N;
    mdl(p) = log(err(p)) + p*log(N)/N;
    aic(p) = log(err(p)) + 2*p/N;
    aicc(p) = aic(p) + 2*p*(p+1)/(N-p-1);
    output(:,p) = y;
end

sound(output(:,4),Fs);


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

figure
plot(Rp)
xlabel('model order')
ylabel('Prediction Gain')
title('Prediction Gain vs. AR model order')
set(gca,'FontSize',14)
grid on




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
title('Yule-walker Error vs. AR model order')
set(gca,'FontSize',14)
grid on









