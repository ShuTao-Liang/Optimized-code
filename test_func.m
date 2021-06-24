global n
B1 = load('leu_test.mat');
A1 = B1.X_test(:,1:n);
b1 = B1.y_test;


sign = (A1*x >= 0);
error_rate = sum(abs((sign - b1)))./length(b1);

sign1 = (A*x >= 0);
error_rate1 = sum(abs((sign1 - b)))./length(b);