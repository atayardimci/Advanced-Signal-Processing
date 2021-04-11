function Px = pgm(x)

    N = length(x);
    Px = zeros(N, 1);
    
    for f = 0:N-1
        s = 0;
        for n = 0:N-1
            s = s + x(n+1) * exp(-1j*2*pi*(f)*(n/N));            
        end
        tmp = (abs(s)^2) / (N);
        Px(f+1) = tmp;
    end
end