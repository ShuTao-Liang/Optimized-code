clear all
clc

x1 = randn(50,1);
x2 = randn(50,1);
b = (2*x1 + x2 + randn(size(x1))) > 1;

figure; hold on;
h1 = scatter(x1(b==0),x2(b==0),50,'k','filled'); % black dots for 0
h2 = scatter(x1(b==1),x2(b==1),50,'w','filled'); % white dots for 1
set([h1 h2],'MarkerEdgeColor',[.5 .5 .5]); % outline dots in gray
legend([h1 h2],{'y==0' 'y==1'},'Location','NorthEastOutside');
xlabel('x_1');
ylabel('x_2');

A = [x1,x2];


kmax = 10000;
eps = 1e-4;
x0 = zeros(2,1);
L = 5;
lam = 5;

[x,obj,time,iter] = proximal_gradient(A,b,kmax,eps,x0,L,lam);

modelfit = A*x >= 0;
%������ȷ�ٷֱȣ����ݵ�İٷֱ�
%��ģ����ȷ����ģ�
error_rate2 =  sum(modelfit~=b) / length(b) * 100;
%���ӻ�ģ��
%׼��һ��������������ģ��
ax = axis;
xvals = linspace(ax(1),ax(2),100);
yvals = linspace(ax(3),ax(4),100);
[xx,yy] = meshgrid(xvals,yvals);
 % �����ع����
X = [xx(:) yy(:)];

% �ڵ㴦����ģ��
outputimage = reshape(X*x,[length(yvals) length(xvals)]);
%���ӻ�ͼ��
%����N����ÿ��ά�ȵ�������
%��ͼ���Ƶ��ʵ���λ��
%ͨ������XData��YData��ʵ����һ��
h3 = imagesc(outputimage,[0 1]); %logistic�����ķ�Χ��0��1
set(h3,'XData',xvals,'YData',yvals);
colormap(hot);
colorbar;
%���ӻ���ģ�͹����ľ��߽߱�
%ͨ������ͼ���0.5����
[c4,h4] = contour(xvals,yvals,outputimage,[.5 .5]);
set(h4,'LineWidth',3,'LineColor',[0 0 1]); % �����Ӻ񣬸�Ϊ��ɫ
 %��ͼ���͵��ײ����Ա����ǿ��Կ������ݵ�
uistack(h3,'bottom');
%���������͵�����
uistack(h4,'top');
%�ָ�ԭʼ�᷶Χ
axis(ax);
%�ڱ����б���ģ�͵Ĵ�����
title(sprintf('�������� %.1f%%',error_rate2))