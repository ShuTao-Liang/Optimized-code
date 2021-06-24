function alpha = wolfe(x, d, g, fk)
alpha = 1; 
% 参数
sigma1 = 0.25;
sigma2 = 0.75;
%区间法
a = 0; b = Inf; %放大和缩小alpha用到的参数

while (1) %一直循环
    fn = fun(x + alpha*d); % f(x + alpha*d)
    if fn > fk + sigma1*alpha*g'*d % 判断是否满足第1个式子
        b = alpha;        
        alpha = (alpha + a)/2; % 缩小alpha
        continue; %结束本次循环，进行下一次循环
    end
    gn = gfun(x + alpha*d); %g_k+1
    if gn'*d < sigma2*g'*d % 判断是否满足第2个式子
        a = alpha;
        alpha = min([2*alpha, (b+alpha)/2]); % 放大alpha
        continue;
    end
    break;
end
end
