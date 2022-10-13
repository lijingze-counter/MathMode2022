function [shangyici,ReturnSign,returntemp,PathMat,PathMatNum,PathReturnNum,PSBGeneral,sendingWait,TempTime2,ReturnType,temp2,j,tempNum,SignNum,Numj,CarMode3,Power3,Drive3,sit3,PathNumSend,NO,PathReturn,Returner]=VehicleSending(NUM,aa,ReturnSign,returntemp,time,PathMatNum,PathReturnNum,TempTime2,PathMat,PSBGeneral,ReturnType,temp2,j,sendingWait,tempNum,SignNum,Numj,CarMode3,Power3,Drive3,PathNumSend,sit3,NO,PathReturn,Returner,shangyici)
%判断接车横移机是否空闲
[num, CarModel, Power, Drive] = importfile1("D:\math model\附件2.xlsx", "Sheet1", [2, 319]);        %导入附件1数据


if TempTime2 > time-1
        sendingWait=0;
        if ReturnSign==0
    sit3(PSBGeneral(1,2))=2;
        else
            sit3(Returner(1,2))=2;
    
        end

    
    
else

if TempTime2 < time-1
        sendingWait=1;
   
else


if TempTime2 == time-1
    
    if returntemp==1 && ReturnSign==1
        if PathReturn(1,10)==0
        PathReturn(1,10)=Returner(1,1);
        PathReturnNum(1,10)=Returner(1,2);
         sit3(Returner(1,2))=71;
        fprintf("返回车道");
       returntemp=0;
       ReturnSign=0;
        else
       TempTime2=TempTime2+1;
        end
    else
        if returntemp==1 && ReturnSign==0
            sit3(PSBGeneral(1,2))=3;
            j=j+1;
        else
        
       
        if j>1
            
       fprintf("第%d送往PBS总装\n",j-1);    %j-1
        sit3(PSBGeneral(1,2))=3;
        end
     %   j=j+1;
        end
    end
    

    sendingWait=1;
    
else
    


end
end

if  sendingWait==1
    A=sum(PathMat);
if  A(10)~=0             %判定1-6车道有车
          
   
       %找到第一个到达的车辆%%
   taptap=PathMatNum(find(PathMatNum(:,10)~=0),10);               %最右边的所有车号
   
    
   
   for nn=1:size(taptap)                                        %找到最先到达的车
       xuhao(nn)=max(find(NUM(:,2)==taptap(nn)));
   end
   temp=NUM(min(xuhao),2);       %这里的temp是车号
   
   
   
   
   
    PathNumSend=find(PathMatNum(:,10)==temp);

   if returntemp==0
    %% 返回车道判断
    CarNumData=PathMatNum(PathNumSend,10);  %来车序号
    
    zheyici=PathMat(PathNumSend,10);   %来车型号
    
    [CarMode, Power, Drive]=cars(zheyici);
   
    
    if CarNumData>1
     [CarMode, Powershang, Drive]=cars(shangyici);

    shangyici=zheyici;    
    if Powershang=="混合"&& Power=="燃油"
        [ReturnSign]=Sort(CarNumData,NUM,aa);
        if ReturnSign~=0

            returntemp=ReturnSign;
            ReturnSign=0;
        end
    else
        ReturnSign=0;
    end
    else
        ReturnSign=0;
    end
   else
    ReturnSign=returntemp;
    
   end
    
    
    if ReturnSign==0
    
    %% 输出到PSB总装

    sendingSpendTime=[18,12,6,0,12,18];
    TempTime2=time+sendingSpendTime(PathNumSend);

   
   PSBGeneral(1,1)=PathMat(PathNumSend,10);   %输出到PSB总装    %车道进入
   PSBGeneral(1,2)=PathMatNum(PathNumSend,10);
   
 %    sit3(PathMatNum(PathNumSend,10))=3;    %%%%%%%%%%%%%%%%%%%%%%%%%%还有问题，送入总装时间太早
   
PathMatNum(PathNumSend,10)=0;
        PathMat(PathNumSend,10)=0;
   
   

    
    Numj(j,1)=j;
    [CarMode3(j,1), Power3(j,1), Drive3(j,1)]=cars(PSBGeneral(1,1));
 

    
     j=j+1;
    else
        %%  输出到返回
        
        sendingSpendTime=[24,18,12,6,12,18];
        TempTime2=time+sendingSpendTime(PathNumSend);
        
        Returner(1,1)=PathMat(PathNumSend,10);   %放进临时返回道
        
       Returner(1,2)=PathMatNum(PathNumSend,10);
            PathMat(PathNumSend,10)=0;
   PathMatNum(PathNumSend,10)=0;

    
j=j-1;
    end

    
end
% ReturnSign=0;
end

end

end


