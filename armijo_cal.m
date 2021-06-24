function alpha = armijo_cal( x, d, g, f )
alpha = 1e-10;
sigma = 1e-3;

for i = 1:30
   xn = x + alpha*d;
   fn = fun(xn);
   if fn <= f + sigma*alpha*g'*d
       break;
   end
   alpha = alpha*0.1;
end

if i==1
   while fn <= f + sigma*alpha*g'*d
       alpha_old = alpha;
       alpha = alpha_old*10;
       xn = xn + alpha*d;
       fn = fun(xn);
   end
end
alpha = alpha_old;
end