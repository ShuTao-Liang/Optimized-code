function [x, f, iter, time] = steepest_descent(x0, kmax, eps)
global A b
tic;
f = zeros(kmax,1);
x = x0;

for iter = 1 : kmax
    f(iter) = fun(A,b,x);
    g = gfun(A,b,x);
    if norm(g) <= eps 
        break;
    end
    d = -g;
    alpha = armijo(x, d, g, f(iter));
    x = x + alpha*d;
end
time = toc;
f = f(1:iter);
end