clc;clear

nVar = 636; % ����x�ĳ���?
nPop = 30; % ��Ⱥ��������ģ��
maxIt = 2000; % ����������?
nPc = 0.8; % �������
nC = round(nPop * nPc / 2) * 2; % �Ӵ���ģ
nMu = 0.01; % �������


% �յĽṹ��
template.x = [];
template.y = [];

% ������Ⱥ 
Parent = repmat(template, nPop, 1);



for i = 1 : nPop
    
    Parent(i).x = randi([0, 1], 1, nVar);
    Parent(i).y = PSBCar(Parent(i).x);     %����y
    
end

for It = 1 : maxIt
    

    Offspring = repmat(template, nC/2, 2);
    
    for j = 1 : nC / 2     
        
   
        p1 = selectPop(Parent);
        p2 = selectPop(Parent);
        
        % 交叉
        [Offspring(j, 1).x, Offspring(j, 2).x] = crossPop(p1.x, p2.x);
        
    end
    
    Offspring = Offspring(:);
    

    for k = 1 :nC
        Offspring(k).x = mutatePop(Offspring(k).x, nMu);
        Offspring(k).y = PSBCar(Offspring(k).x);
    end
    
    % 合并种群
    newPop = [Parent; Offspring];
    
    % 排序
    [~, so] = sort([newPop.y], 'ascend');
    newPop = newPop(so);
    
    % 筛�??
    Parent = newPop(1 : nPop);
    
    disp(['��������?', num2str(It), '��߷���Ϊ��?', num2str(Parent(1).y)])
    
end


