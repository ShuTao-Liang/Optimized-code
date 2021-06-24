function g = gfun(A,b,x)
global m n
c = zeros(m,n);
C = zeros(m,n);
for i = 1:m
    c(i,:) = b(i).*A(i,:);
    C(i,:) = (exp(A(i,:)*x).*A(i,:))./(1 + exp(A(i,:)*x));
end
g = sum(C - c).';
end