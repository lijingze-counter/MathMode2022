%��ע΢�Ź��ںţ����ð���ģ������Ѱ����㷨�ͱ���˼·
clear
clc
T=1000; %��ʼ���¶�ֵ
T_min=1; %�����¶��½�
alpha=0.99; %�¶ȵ��½���
num=1000; %��������
n=2; %�Ա�������
sub=[]; %�Ա�������
up=[]; %�Ա�������
for i=1:num
    for j=1:n
        x(i,j)=;
    end
    fx(i,1)=fun(x(i,1),x(i,2));
end

%����С��Ϊ��
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
disp('���Ž�Ϊ��')
disp(bestx)
disp('����ֵΪ��')
disp(bestf)

figure
plot(trace)
xlabel('��������')
ylabel('����ֵ')
title('ģ���˻��㷨')
legend('����ֵ')