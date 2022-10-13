%%%%%%%%%%%%%%%%%%%%接车横移机%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%接车横移机接车途径：1.涂装PBS
%                   2.返回道接受（其中返回通道优先级大于涂装PBSz）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%接车横移机判定
function [X1,NUM,aa,PathMat,PathMatNum,temp,ReceivWait,TempTime,ReturnNumber,i,PathNum1,sit,NO,PathReturn,PathReturnNum]=VehicleReceiving(X1,NUM,aa,PathMatNum,time,ReturnType,ReturnNumber,i,TempTime,PathMat,temp,PathReturn,PathNum1,sit,NO,PathReturnNum)
%判断接车横移机是否空闲
[num, CarModel, Power, Drive] = importfile1("D:\math model\附件2.xlsx", "Sheet1", [2, 319]);
% if(i<319)
    
if TempTime <= time                              %%%%%%%判断时间

if i>=319                                       %%%%%如果车辆全部进入
           temp(PathNum1,1)=0;
      
        ReceivWait=1;
else                                               %%车辆没有全部进入
        TempTime=time;
    PathMat(PathNum1,1)=temp(PathNum1,1);           %车道进入
    PathMatNum(PathNum1,1)=temp(PathNum1,2);    	%车道进入
    aa=aa+1;
    NUM(aa,2)=temp(PathNum1,2);
    fprintf("第%d辆车已进入",i);
    sit(temp(PathNum1,2))=PathNum1*100+10;          %更新位置坐标
    temp=[0,0];
    ReceivWait=1;
    i=i+1;
end
else                                                %如果时间没到
    ReceivWait=0;                                   %更新位置和时间
    sit(temp(PathNum1,2),1)=1;
    

end
if  ReceivWait==1                               %如果空闲

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%遗传算法改进
if PathReturn(1,1)~=0  &&  X1(aa)==1                       %判定返回车道有车

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    ReturnNumber=ReturnNumber+1;                %返回车数量加一

    ReturnSpendTime=[24,18,12,6,12,18];         %接车到各个车道所需的时间
    temp=find(PathMat(:,1)==0);                 %寻找空闲车道
    [k,~]=min(ReturnSpendTime(temp)) ;          %车道选择
    k=temp(find(ReturnSpendTime(temp)==k));             
    PathNum1=k(1);                              %车道PathNum
   
    TempTime=time+ReturnSpendTime(PathNum1);    %更新时间
    


    a=PathReturnNum(1,1);
   
    temp=zeros(6,2);    
   type=zeros(800,2);

          type(i+ReturnNumber,1)=types(CarModel(a), Power(a), Drive(a),a);      %汽车类型放在type

    temp(PathNum1,1)=type(i+ReturnNumber,1);                             %放入等待队列
    temp(PathNum1,2)=a;
    sit(temp(PathNum1,2),1)=1;
    i=i-1;
PathReturnNum(1,1)=0;
    PathReturn(1,1)=0; 
    
    
else                                 %%不选择返回道路
    if(i<319)
    ReturnSpendTime=[18,12,6,0,12,18];          %接车到各个车道所需的时间
    
  
    temp=find(PathMat(:,1)==0);                     %寻找空闲车道
    [k,~]=min(ReturnSpendTime(temp))      ;    %车道选择
    k=temp(find(ReturnSpendTime(temp)==k));
    PathNum1=k(1);

    TempTime=time+ReturnSpendTime(PathNum1);


   
     temp=zeros(6,2);    
    type=zeros(800,2);

    type(i+ReturnNumber,1)=types(CarModel(i), Power(i), Drive(i),i);      %汽车类型放在type
    if type(i+ReturnNumber,2)==0
        type(i+ReturnNumber,2)=i;
    end
    temp(PathNum1,:)=type(i+ReturnNumber,:);                             %放入等待队列
   
    sit(temp(PathNum1,2),1)=1;
    else
           
       temp(PathNum1,1)=0;
    
       X1(aa)=1;
        ReceivWait=1;
    end

end

end  
 
%i=i+1;


   



end