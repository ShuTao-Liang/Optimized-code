function alpha = wolfe(x, d, g, fk)
alpha = 1; 
% ����
sigma1 = 0.25;
sigma2 = 0.75;
%���䷨
a = 0; b = Inf; %�Ŵ����Сalpha�õ��Ĳ���

while (1) %һֱѭ��
    fn = fun(x + alpha*d); % f(x + alpha*d)
    if fn > fk + sigma1*alpha*g'*d % �ж��Ƿ������1��ʽ��
        b = alpha;        
        alpha = (alpha + a)/2; % ��Сalpha
        continue; %��������ѭ����������һ��ѭ��
    end
    gn = gfun(x + alpha*d); %g_k+1
    if gn'*d < sigma2*g'*d % �ж��Ƿ������2��ʽ��
        a = alpha;
        alpha = min([2*alpha, (b+alpha)/2]); % �Ŵ�alpha
        continue;
    end
    break;
end
end
