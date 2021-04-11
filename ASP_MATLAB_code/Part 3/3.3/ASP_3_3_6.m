clear all

load sunspot.dat

MSE = [];
data_lengths = [];
test_data = sunspot(249:288, 2);
for N = 10:5:250
    
    x = sunspot(1:N, 2);
    
    [c, lags] = xcorr(x, 'unbiased');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    Rxx = c(N:length(c));
    M = 2;
    
    xx = Rxx(2:M+1);
    H = Rxx(1:M);
    
    tmp = zeros(M,1);
    tmp(2:M) = Rxx(1:M-2+1);
    tmp(1:2-1) = flip(Rxx(2:2));
    
    Hnew = zeros(M,2);
    Hnew(:, 1:2-1) = H;
    Hnew(:,2) = tmp;
    
    H = Hnew;
    
    a = inv(transpose(H)*H)*transpose(H)*xx;
    display(['N = ', num2str(N)])
    display(a)
    
    
    y = zeros(38,1);
    for i = 1:38
        y(i) = dot(a,flip(test_data(i:i+1)));
    end    
    MSE = [MSE immse(test_data(3:40),y)];   
    data_lengths = [data_lengths N];
  
end


figure
plot(data_lengths, MSE)
xlabel('N')
ylabel('MSE')
xticks(0:25:250)
set(gca,'FontSize',30)
title('Approximation MSE vs. Data Length', 'FontSize',34)
grid on






%%%%%%%%%%%%%%%%%%%%%%%%%
















