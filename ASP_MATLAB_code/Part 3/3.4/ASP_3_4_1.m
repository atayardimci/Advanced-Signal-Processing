%clear all

freqtable = zeros(10,2);

freqtable(1,:) = [941 1336];
freqtable(2,:) = [697 1209];
freqtable(3,:) = [697 1336];
freqtable(4,:) = [697 1477];
freqtable(5,:) = [770 1209];
freqtable(6,:) = [770 1336];
freqtable(7,:) = [770 1477];
freqtable(8,:) = [852 1209];
freqtable(9,:) = [852 1336];
freqtable(10,:) = [852 1477];


%number = [0 2 0];
population = [0 1 2 3 4 5 6 7 8 9];
extension = randsample(population, 8, true);

%number = [number extension]


n = 1/32768:1/32768:0.25;

y = [];
for i = 1:11
    key = number(i);
    f1 = freqtable(key+1,1);
    f2 = freqtable(key+1,2);
    
    x1 = sin(2*pi*f1*n) + sin(2*pi*f2*n);
    x2 = 0 * n;
    
    if i ~= 11
        y = [y x1 x2];
    else
        y = [y x1];
    end

end

sigma = 8;
noise = randn(1, 172032) * sigma;
y = y + noise;

figure
plot(noise)

time = 1/32768:1/32768:5.25;

figure
plot(time, y)
xlabel('time (seconds)')
ylabel('y[n]')
numberstr = [num2str(number(1)), num2str(number(2)), num2str(number(3)), num2str(number(4)), num2str(number(5)), num2str(number(6)), num2str(number(7)), num2str(number(8)), num2str(number(9)), num2str(number(10)), num2str(number(11))];
title(['Discrete time sequence for ' numberstr ' with noise \sigma^2=' num2str(sigma^2)])
set(gca,'FontSize',40)
xlim([0 5.5])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
spectrogram(y, hann(8192), 0, [], 32768, 'yaxis')
title(['Spectrogram of ' numberstr ' with noise \sigma^2=' num2str(sigma^2)])
xticks(0:0.25:5.25)
yticks(0.5:0.1:1.6)
ylim([0.5 1.6]);
set(gca,'FontSize',40)

























