clear all

load sunspot.dat
N = 288;

x = sunspot(1:N, 2);
m = mean(x);
s = std(x);
x = x - m;
x = x./s;


sys1 = ar(x, 1);
sys2 = ar(x, 2);
sys3 = ar(x, 3);
sys4 = ar(x, 4);
sys5 = ar(x, 5);
sys6 = ar(x, 6);
sys7 = ar(x, 7);
sys8 = ar(x, 8);
sys9 = ar(x, 9);
sys10 = ar(x, 10);


loss = ones(10,1);
loss(1) = sys1.Report.Fit.MSE;
loss(2) = sys2.Report.Fit.MSE;
loss(3) = sys3.Report.Fit.MSE;
loss(4) = sys4.Report.Fit.MSE;
loss(5) = sys5.Report.Fit.MSE;
loss(6) = sys6.Report.Fit.MSE;
loss(7) = sys7.Report.Fit.MSE;
loss(8) = sys8.Report.Fit.MSE;
loss(9) = sys9.Report.Fit.MSE;
loss(10) = sys10.Report.Fit.MSE;


err = loss.*N;
err = log(err);

k = 10;
mdl = ones(k,1);
aic = ones(k,1);
aicc = ones(k,1);
for p=1:k
    mdl(p) = err(p) + p*log(N)/N;
    aic(p) = err(p) + 2*p/N;
    aicc(p) = aic(p) + 2*p*(p+1)/(N-p-1);
end

figure
hold on
plot(err)
plot(mdl)
plot(aic)
plot(aicc)
legend('log(error)', 'mdl', 'aic', 'aicc', 'Location','northwest')
