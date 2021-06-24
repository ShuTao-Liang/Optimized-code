x1 = randn(50,1);
x2 = randn(50,1);
b1 = (2*x1 + x2 + randn(size(x1))) > 1;

figure; hold on;
h1 = scatter(x1(b1==0),x2(b1==0),50,'k','filled'); %黑点表示0
h2 = scatter(x1(b1==1),x2(b1==1),50,'w','filled'); % 白点表示1
set([h1 h2],'MarkerEdgeColor',[.5 .5 .5]); % 灰色轮廓点
legend([h1 h2],{'y==0' 'y==1'},'Location','NorthEastOutside');
xlabel('x_1');
ylabel('x_2');

A1 = [x1,x2];


sign1 = (A1*x >= 0);
error_rate = sum(abs((sign1 - b1)))./length(b1);

sign2 = (A*x >= 0);
error_rate1 = sum(abs((sign2 - b)))./length(b);


modelfit = A1*x >= 0;
%计算正确百分比（数据点的百分比
%按模型正确分类的）
error_rate2 =  sum(modelfit~=b1) / length(b) * 100;
%可视化模型
%准备一个点网格来评估模型
ax = axis;
xvals = linspace(ax(1),ax(2),100);
yvals = linspace(ax(3),ax(4),100);
[xx,yy] = meshgrid(xvals,yvals);
 % 建立回归矩阵
X = [xx(:) yy(:)];

% 在点处评估模型
outputimage = reshape(X*x,[length(yvals) length(xvals)]);
%可视化图像
%其中N是沿每个维度的像素数
%把图像移到适当的位置
%通过设置XData和YData来实现这一点
h3 = imagesc(outputimage,[0 1]); %logistic函数的范围是0到1
set(h3,'XData',xvals,'YData',yvals);
colormap(hot);
colorbar;
%可视化与模型关联的决策边界
%通过计算图像的0.5轮廓
[c4,h4] = contour(xvals,yvals,outputimage,[.5 .5]);
set(h4,'LineWidth',3,'LineColor',[0 0 1]); % 线条加厚，改为蓝色
 %将图像发送到底部，以便我们可以看到数据点
uistack(h3,'bottom');
%将轮廓发送到顶部
uistack(h4,'top');
%恢复原始轴范围
axis(ax);
%在标题中报告模型的错率性
title(sprintf('错误率是 %.1f%%',error_rate2))