function g = gfun(A,b,x)
c = zeros(50,2);
C = zeros(50,2);
for i = 1:50
    c(i,:) = b(i).*A(i,:);
    C(i,:) = (exp(A(i,:)*x).*A(i,:))./(1 + exp(A(i,:)*x));
end
g = sum(C - c).';
end