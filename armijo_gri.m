function alpha = armijo_gri(x,d,g,f)  %此时传入的f为目标函数值向量
alpha = 1;
sigma = 1e-3;
M = 5;           %和前5次迭代最大目标函数值比较，看是否满足充分下降性

k = nnz(f);
if k > M 
    f = f( k-M+1 : k );
end

for i = 1:30
   xn = x + alpha*d;
   fn = fun(xn);   
   if fn <= max(f) + sigma*alpha*g'*d
       break;
   end
   alpha = alpha*0.1;
end
  
end