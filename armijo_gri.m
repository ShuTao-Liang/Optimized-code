function alpha = armijo_gri(x,d,g,f)  %��ʱ�����fΪĿ�꺯��ֵ����
alpha = 1;
sigma = 1e-3;
M = 5;           %��ǰ5�ε������Ŀ�꺯��ֵ�Ƚϣ����Ƿ��������½���

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