%关注微信公众号：您好啊数模君，免费白嫖算法和比赛思路
clear
clc
T=1000; %初始化温度值
T_min=1; %设置温度下界
alpha=0.99; %温度的下降率
num=1000; %颗粒总数
n=2; %自变量个数
sub=[]; %自变量下限
up=[]; %自变量上限
for i=1:num
    for j=1:n
        x(i,j)=;
    end
    fx(i,1)=fun(x(i,1),x(i,2));
end

%以最小化为例
[bestf,a]=min(fx);
bestx=x(a,:);
trace(1)=bestf;
while(T>T_min)
	for i=1:num
        for j=1:n
            xx(i,j)=;
        end
        ff(i,1)=fun(xx(i,1),xx(i,2));
        delta=ff(i,1)-fx(i,1);
        if delta<0
            fx(i,1)=ff(i,1);
            x(i,:)=xx(i,:);
        else
            P=exp(-delta/T);
            if P>rand
                fx(i,1)=ff(i,1);
                x(i,:)=xx(i,:);
            end
        end  
    end
    if min(fx)<bestf
        [bestf,a]=min(fx);
        bestx=x(a,:);
    end
    trace=[trace;bestf];
    T=T*alpha;
end
disp('最优解为：')
disp(bestx)
disp('最优值为：')
disp(bestf)

figure
plot(trace)
xlabel('迭代次数')
ylabel('函数值')
title('模拟退火算法')
legend('最优值')