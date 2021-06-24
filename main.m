clear all
clc

global m n
m = 38;
n = 2000;
B = load('leu_train.mat');
A = B.X_train(:,1:n);
b = B.y_train;

kmax = 10000;
eps = 1e-4;
x0 = zeros(n,1);
L = 10;
lam = 2;

[x,obj,time,iter] = proximal_gradient(A,b,kmax,eps,x0,L,lam);

