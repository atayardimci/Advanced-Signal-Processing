clear all
num_bins = 20;
num_samples = 10^7;
x = rand(1, num_samples);

[freq, bin_value] = hist(x, num_bins);
% We can use the histogram function in the pdf format to do the following.
% However, we do it here manually for clarification
figure
hist(x, num_bins)
figure
bar(bin_value, freq./num_samples.*num_bins, 'hist')
hold on
y = ones(1, length(x));
plot(x, y)
xlabel('x', 'FontSize', 20)
ylabel('pdf(x)', 'FontSize', 20)
title('pdf of X', 'FontSize', 24)
set(gca,'FontSize',20)