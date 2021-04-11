clear all

N = (1:50:1001);

V = (1:50:1001);
V = transpose(V);

a1 = (-1:0.1:1);
a1 = transpose(a1);


crb_sigma = (V.^2 * N.^-1).*2;

figure
subplot(1,2,1)
heatmap(N, V, 10*log10(crb_sigma),'Colormap', jet)
xlabel('N')
ylabel('\sigma^2')
title('CRLB for the estimator of \sigma^2 (logscale)')
set(gca,'FontSize',14)




crb_a = (-(a1.^2) + 1) * N.^-1;

subplot(1,2,2)
heatmap(N, a1, 10*log10(crb_a), 'Colormap', jet)
xlabel('N')
ylabel('a_1')
title('CRLB for the estimator of a_1 (logscale)')
set(gca,'FontSize',14)
