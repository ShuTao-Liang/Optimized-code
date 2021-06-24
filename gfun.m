function g = gfun(A,b,x)
global lam n
c = zeros(38,n);
C = zeros(38,n);
for i = 1:38
    c(i,:) = b(i).*A(i,:);
    C(i,:) = (exp(A(i,:)*x).*A(i,:))./(1 + exp(A(i,:)*x)) + 2*lam.*x.';
end
g = sum(C - c).';
end