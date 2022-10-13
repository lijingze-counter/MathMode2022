function Fraction=PSBCar(X1)



% X1=randi((0:1),636,1);
% X2=randi((0:1),318,1);



times=zeros(100,1);
[num, CarModel, Power, Drive] = importfile1("D:\math model\附件2.xlsx", "Sheet1", [2, 319]);        %导入附件1数据

    
NUM(:,1)=1:1000;  
aa=0;

PathMat=zeros(6,10);    %初始化车道矩阵
PathMat1=zeros(6,10);    %初始化车道矩阵

PathMatNum=zeros(6,10);

PathReturn=zeros(1,10); %返回车道初始化矩阵
PathReturnNum=zeros(1,10);

ReturnNumber=0;
time=0;
TempTime=1;
TempTime2=0;
temp=zeros(6,2); %预进入车队队列
temp(4,1)=4;
temp(4,2)=1;
temp2=zeros(6,2);
ReturnType=zeros(1,10);
PathReturn=zeros(1,10);
No=zeros(6,1);
i=1;
j=1;
[n,m]=size(num);
PSBGeneral=zeros(1,2);
Returner=zeros(1,2);
ReturnType=0;

PathNum1=4;
sendingWait=1;
tempNum=0;
SignNum=0;
Numj=0;
CarMode3="0";
Power3="0";
Drive3="0";
PathNumSend=1;
SitTime=zeros(n,1);
sit1=zeros(n,1);
NO=zeros(6,1);

returntemp=0;
TempN=0;
ReturnSign=0;
shangyici=0;
Stop=1;
while(j<=n)
time=time+1;
% fprintf("%d\n",time);
sit1=zeros(n,1);
if j>1
sit1(find(sit==3))=3;
end
sit=sit1;
[PathReturn]=pathreturn(PathReturn,time); %操作返回车道
%[PathReturnNum,sit5]=pathreturnnum(PathReturnNum,sit,time,n);
%sit=sit5;
[PathReturnNum,sit,PathMatNum]=pathData(PathReturnNum,PathMatNum,time,n,sit);
PathMat=path(PathMat,time); %操作送车车道

[X1,NUM,aa,PathMat,PathMatNum,temp,ReceivWait,TempTime,ReturnNumber,i,PathNum1,sit,NO,PathReturn,PathReturnNum]=VehicleReceiving(X1,NUM,aa,PathMatNum,time,ReturnType,ReturnNumber,i,TempTime,PathMat,temp,PathReturn,PathNum1,sit,NO,PathReturnNum);

[shangyici,ReturnSign1,returntemp1,PathMat1,PathMatNum,PathReturnNum1,PSBGeneral,sendingWait,TempTime2,ReturnType,temp2,j,tempNum,SignNum,Numj,CarMode3,Power3,Drive3,sit,PathNumSend,NO,PathReturn,Returner]=VehicleSending(NUM,aa,ReturnSign,returntemp,time,PathMatNum,PathReturnNum,TempTime2,PathMat,PSBGeneral,ReturnType,temp2,j,sendingWait,tempNum,SignNum,Numj,CarMode3,Power3,Drive3,PathNumSend,sit,NO,PathReturn,Returner,shangyici);
returntemp=returntemp1;
ReturnSign=ReturnSign1;

PathMat=PathMat1;
PathReturnNum=PathReturnNum1;
SitTime(:,time)=sit;



while (sum(sum(PathMatNum))==0 && sum(PathReturn)==0)
    Stop=0;
    break;
end
    



  
end


% time1=[1:time];
% NUm=[1:n];
% NUm=NUm';
% xlswrite('D:\math model\result12.xlsx',time1,1,'B1');
% xlswrite('D:\math model\result12.xlsx',NUm,1,'A2');
% xlswrite('D:\math model\result12.xlsx',SitTime,1,'B2');
% shuchu=["序号","车型","动力","驱动"];
%         xlswrite('D:\math model\列表12.xlsx',shuchu,1,'A1');
% 
%         xlswrite('D:\math model\列表12.xlsx',Numj,1,'A2');
%         xlswrite('D:\math model\列表12.xlsx',CarMode3,1,'B2');
%         xlswrite('D:\math model\列表12.xlsx',Power3,1,'C2');
%         xlswrite('D:\math model\列表12.xlsx',Drive3,1,'D2');

for kkk=1:318
    [powerNum(kkk),DriveNum(kkk)]=typess( Power3(kkk),Drive3(kkk));
        
end       
powerNum=powerNum';
DriveNum=DriveNum';
Fraction=costfunction(powerNum,DriveNum,time,ReturnNumber);


end


