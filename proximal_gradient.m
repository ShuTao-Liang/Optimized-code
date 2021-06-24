function [x,obj,time,iter] = proximal_gradient(A,b,kmax,eps,x0,L,lam)
xk = x0;
Lk = L;
eta = 2;
obj = zeros(kmax,1);
tic
for iter = 1:kmax
   fk = fun(A,b,xk);
   gk = gfun(A,b,xk);
   obj(iter) = fk + lam*norm(xk,2)^2;   %目标函数值
   for iter_L = 1:30                  %回溯法，最大迭代次数30
      x = prox(xk - gk/Lk,lam/Lk);
      f = fun(A,b,x);
      if f <= fk + gk'*(x-xk) + 0.5*Lk*(x-xk)'*(x-xk)
          break;
      end
      Lk = eta*Lk;
   end
   
   if norm(x-xk)/norm(xk) <= eps
       break;
   end
   xk = x;
end
time = toc;
obj = obj(1:iter);
end