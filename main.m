clc;clear

nVar = 636; % 接收x的长度?
nPop = 30; % 种群数量（规模）
maxIt = 2000; % 最大迭代次数?
nPc = 0.8; % 交叉比例
nC = round(nPop * nPc / 2) * 2; % 子代规模
nMu = 0.01; % 变异概率


% 空的结构体
template.x = [];
template.y = [];

% 父代种群 
Parent = repmat(template, nPop, 1);



for i = 1 : nPop
    
    Parent(i).x = randi([0, 1], 1, nVar);
    Parent(i).y = PSBCar(Parent(i).x);     %计算y
    
end

for It = 1 : maxIt
    

    Offspring = repmat(template, nC/2, 2);
    
    for j = 1 : nC / 2     
        
   
        p1 = selectPop(Parent);
        p2 = selectPop(Parent);
        
        % 浜ゅ弶
        [Offspring(j, 1).x, Offspring(j, 2).x] = crossPop(p1.x, p2.x);
        
    end
    
    Offspring = Offspring(:);
    

    for k = 1 :nC
        Offspring(k).x = mutatePop(Offspring(k).x, nMu);
        Offspring(k).y = PSBCar(Offspring(k).x);
    end
    
    % 鍚堝苟绉嶇兢
    newPop = [Parent; Offspring];
    
    % 鎺掑簭
    [~, so] = sort([newPop.y], 'ascend');
    newPop = newPop(so);
    
    % 绛涢??
    Parent = newPop(1 : nPop);
    
    disp(['迭代次数?', num2str(It), '最高分数为：?', num2str(Parent(1).y)])
    
end


