function f = fun(A,b,x)
f = sum(log(1 + exp(A*x)) - b.*A*x);
end