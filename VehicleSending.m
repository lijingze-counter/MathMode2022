function [shangyici,ReturnSign,returntemp,PathMat,PathMatNum,PathReturnNum,PSBGeneral,sendingWait,TempTime2,ReturnType,temp2,j,tempNum,SignNum,Numj,CarMode3,Power3,Drive3,sit3,PathNumSend,NO,PathReturn,Returner]=VehicleSending(NUM,aa,ReturnSign,returntemp,time,PathMatNum,PathReturnNum,TempTime2,PathMat,PSBGeneral,ReturnType,temp2,j,sendingWait,tempNum,SignNum,Numj,CarMode3,Power3,Drive3,PathNumSend,sit3,NO,PathReturn,Returner,shangyici)
%�жϽӳ����ƻ��Ƿ����
[num, CarModel, Power, Drive] = importfile1("D:\math model\����2.xlsx", "Sheet1", [2, 319]);        %���븽��1����


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
        fprintf("���س���");
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
            
       fprintf("��%d����PBS��װ\n",j-1);    %j-1
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
if  A(10)~=0             %�ж�1-6�����г�
          
   
       %�ҵ���һ������ĳ���%%
   taptap=PathMatNum(find(PathMatNum(:,10)~=0),10);               %���ұߵ����г���
   
    
   
   for nn=1:size(taptap)                                        %�ҵ����ȵ���ĳ�
       xuhao(nn)=max(find(NUM(:,2)==taptap(nn)));
   end
   temp=NUM(min(xuhao),2);       %�����temp�ǳ���
   
   
   
   
   
    PathNumSend=find(PathMatNum(:,10)==temp);

   if returntemp==0
    %% ���س����ж�
    CarNumData=PathMatNum(PathNumSend,10);  %�������
    
    zheyici=PathMat(PathNumSend,10);   %�����ͺ�
    
    [CarMode, Power, Drive]=cars(zheyici);
   
    
    if CarNumData>1
     [CarMode, Powershang, Drive]=cars(shangyici);

    shangyici=zheyici;    
    if Powershang=="���"&& Power=="ȼ��"
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
    
    %% �����PSB��װ

    sendingSpendTime=[18,12,6,0,12,18];
    TempTime2=time+sendingSpendTime(PathNumSend);

   
   PSBGeneral(1,1)=PathMat(PathNumSend,10);   %�����PSB��װ    %��������
   PSBGeneral(1,2)=PathMatNum(PathNumSend,10);
   
 %    sit3(PathMatNum(PathNumSend,10))=3;    %%%%%%%%%%%%%%%%%%%%%%%%%%�������⣬������װʱ��̫��
   
PathMatNum(PathNumSend,10)=0;
        PathMat(PathNumSend,10)=0;
   
   

    
    Numj(j,1)=j;
    [CarMode3(j,1), Power3(j,1), Drive3(j,1)]=cars(PSBGeneral(1,1));
 

    
     j=j+1;
    else
        %%  ���������
        
        sendingSpendTime=[24,18,12,6,12,18];
        TempTime2=time+sendingSpendTime(PathNumSend);
        
        Returner(1,1)=PathMat(PathNumSend,10);   %�Ž���ʱ���ص�
        
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


