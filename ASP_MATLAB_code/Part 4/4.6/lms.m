function [yhat, e, W] = lms(x, z, mu, p)

w = zeros(p, 1);
W = zeros(p, p);

N = length(x);

yhat = zeros(N, 1);
e = zeros(N, 1);
for n = p:N
    
    x_tmp = flip(x(n-p+1:n));
    yhat(n) = dot(w, x_tmp);
    
    e(n) = z(n) - yhat(n);
    
    mu_tmp = mu / (dot(x_tmp,x_tmp) + 0.001);
    
    w = w + x_tmp.* (mu_tmp * e(n));
    W = [W w];
    
    mu = mu*0.99;
end


end