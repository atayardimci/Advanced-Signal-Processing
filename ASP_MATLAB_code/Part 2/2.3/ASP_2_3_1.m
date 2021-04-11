clear all
c = 10000;
a1 = rand(1,c).*5 -2.5;
a2 = rand(1,c).*3 -1.5;

w = randn(1,1000);


figure
xlim([-2.5 2.5])
ylim([-1.5 1.5])
title('Stability Triangle' )
xlabel('a1')
ylabel('a2')
set(gca,'FontSize',14)
grid on

t = ones(1,c);
for i = 1:c
    x = filter((1),[1 -a1(i) -a2(i)], w);
    
    hold on
    if abs(x(1000)) < 100000000000
        plot(a1(i), a2(i), '*')
    end
    
   
end
