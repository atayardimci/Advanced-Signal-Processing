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
sys10 = ar(x, 10);

H = 1;
yp1_1 = predict(sys1, x, H);
yp2_1 = predict(sys2, x, H);
yp10_1 = predict(sys10, x, H);

H = 2;
yp1_2 = predict(sys1, x, H);
yp2_2 = predict(sys2, x, H);
yp10_2 = predict(sys10, x, H);

H = 5;
yp1_5 = predict(sys1, x, H);
yp2_5 = predict(sys2, x, H);
yp10_5 = predict(sys10, x, H);

H = 10;
yp1_10 = predict(sys1, x, H);
yp2_10 = predict(sys2, x, H);
yp10_10 = predict(sys10, x, H);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
err = ones(3,1);
err(1) = immse(x, yp1_1);
err(2) = immse(x, yp2_1);
err(3) = immse(x, yp10_1);
figure
subplot(4,1,1)
plot(yp1_1)
hold on
plot(yp2_1)
hold on
plot(yp10_1)
hold on
plot(x)
legend(['p = 1, MSE = ' num2str(err(1))], ['p = 2, MSE = ' num2str(err(2))], ['p = 10, MSE = ' num2str(err(3))], 'true data', 'Location', 'northwest')
set(gca,'FontSize',16)
xlabel('n','FontSize',24)
ylabel('model prediction','FontSize',20)
title('Prediction Horizon m = 1','FontSize',28)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
err(1) = immse(x, yp1_2);
err(2) = immse(x, yp2_2);
err(3) = immse(x, yp10_2);
subplot(4,1,2)
plot(yp1_2)
hold on
plot(yp2_2)
hold on
plot(yp10_2)
hold on
plot(x)
legend(['p = 1, MSE = ' num2str(err(1))], ['p = 2, MSE = ' num2str(err(2))], ['p = 10, MSE = ' num2str(err(3))], 'true data', 'Location', 'northwest')
set(gca,'FontSize',16)
xlabel('n','FontSize',24)
ylabel('model prediction','FontSize',20)
title('Prediction Horizon m = 2','FontSize',28)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
err(1) = immse(x, yp1_5);
err(2) = immse(x, yp2_5);
err(3) = immse(x, yp10_5);
subplot(4,1,3)
plot(yp1_5)
hold on
plot(yp2_5)
hold on
plot(yp10_5)
hold on
plot(x)
legend(['p = 1, MSE = ' num2str(err(1))], ['p = 2, MSE = ' num2str(err(2))], ['p = 10, MSE = ' num2str(err(3))], 'true data', 'Location', 'northwest')
set(gca,'FontSize',16)
xlabel('n','FontSize',24)
ylabel('model prediction','FontSize',20)
title('Prediction Horizon m = 5','FontSize',28)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
err(1) = immse(x, yp1_10);
err(2) = immse(x, yp2_10);
err(3) = immse(x, yp10_10);
subplot(4,1,4)
plot(yp1_10)
hold on
plot(yp2_10)
hold on
plot(yp10_10)
hold on
plot(x)
legend(['p = 1, MSE = ' num2str(err(1))], ['p = 2, MSE = ' num2str(err(2))], ['p = 10, MSE = ' num2str(err(3))], 'true data', 'Location', 'northwest')
set(gca,'FontSize',16)
xlabel('n','FontSize',24)
ylabel('model prediction','FontSize',20)
title('Prediction Horizon m = 10','FontSize',28)





