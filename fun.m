function f = fun(A,b,x)
global lam
f = sum(log(1 + exp(A*x)) - b.*A*x) + lam.*norm(x)^2;
end