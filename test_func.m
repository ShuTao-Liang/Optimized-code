x1 = randn(50,1);
x2 = randn(50,1);
b1 = (2*x1 + x2 + randn(size(x1))) > 1;

figure; hold on;
h1 = scatter(x1(b1==0),x2(b1==0),50,'k','filled'); %�ڵ��ʾ0
h2 = scatter(x1(b1==1),x2(b1==1),50,'w','filled'); % �׵��ʾ1
set([h1 h2],'MarkerEdgeColor',[.5 .5 .5]); % ��ɫ������
legend([h1 h2],{'y==0' 'y==1'},'Location','NorthEastOutside');
xlabel('x_1');
ylabel('x_2');

A1 = [x1,x2];


sign1 = (A1*x >= 0);
error_rate = sum(abs((sign1 - b1)))./length(b1);

sign2 = (A*x >= 0);
error_rate1 = sum(abs((sign2 - b)))./length(b);


modelfit = A1*x >= 0;
%������ȷ�ٷֱȣ����ݵ�İٷֱ�
%��ģ����ȷ����ģ�
error_rate2 =  sum(modelfit~=b1) / length(b) * 100;
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