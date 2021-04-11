function pdf(x)

num_bins = 100;
num_samples = length(x);

[freq, bin_value] = hist(x, num_bins);
width = bin_value(2) - bin_value(1);

bar(bin_value, freq./(num_samples.*width), 'hist')

xlabel('x')
ylabel('pdf(x)')
set(gca,'FontSize', 26)
title(['pdf estimation of X for N = ' num2str(num_samples)], 'FontSize', 26)
grid on


