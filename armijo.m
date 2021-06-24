function alpha = armijo(x, d, g, f)
global A b lam
alpha = 1;% 初始值
sigma = 1e-3;% 参数sigma
for i=1:30 % 最大迭代次数为 30
xn = x + alpha*d; 
fn = fun(A,b,xn);% f(xk+alpha*d)
% armijo 规则
if fn <= f + sigma*alpha*g'*d
    break;
end
alpha = alpha*0.1;
end
end