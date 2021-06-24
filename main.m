clear;
clc;

global A b lam n
n = 7129;
x0 = zeros(n,1);
kmax1 = 200;
eps = 1e-3;
B = load('leu_train.mat');
A = B.X_train(:,1:n);
b = B.y_train;
lam = 5;


[x, f1, iter1, time1] = steepest_descent(x0, kmax1, eps);
