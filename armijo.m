function alpha = armijo(x, d, g, f)
global A b lam
alpha = 1;% ��ʼֵ
sigma = 1e-3;% ����sigma
for i=1:30 % ����������Ϊ 30
xn = x + alpha*d; 
fn = fun(A,b,xn);% f(xk+alpha*d)
% armijo ����
if fn <= f + sigma*alpha*g'*d
    break;
end
alpha = alpha*0.1;
end
end