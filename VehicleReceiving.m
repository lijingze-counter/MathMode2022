%%%%%%%%%%%%%%%%%%%%�ӳ����ƻ�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�ӳ����ƻ��ӳ�;����1.ͿװPBS
%                   2.���ص����ܣ����з���ͨ�����ȼ�����ͿװPBSz��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%�ӳ����ƻ��ж�
function [X1,NUM,aa,PathMat,PathMatNum,temp,ReceivWait,TempTime,ReturnNumber,i,PathNum1,sit,NO,PathReturn,PathReturnNum]=VehicleReceiving(X1,NUM,aa,PathMatNum,time,ReturnType,ReturnNumber,i,TempTime,PathMat,temp,PathReturn,PathNum1,sit,NO,PathReturnNum)
%�жϽӳ����ƻ��Ƿ����
[num, CarModel, Power, Drive] = importfile1("D:\math model\����2.xlsx", "Sheet1", [2, 319]);
% if(i<319)
    
if TempTime <= time                              %%%%%%%�ж�ʱ��

if i>=319                                       %%%%%�������ȫ������
           temp(PathNum1,1)=0;
      
        ReceivWait=1;
else                                               %%����û��ȫ������
        TempTime=time;
    PathMat(PathNum1,1)=temp(PathNum1,1);           %��������
    PathMatNum(PathNum1,1)=temp(PathNum1,2);    	%��������
    aa=aa+1;
    NUM(aa,2)=temp(PathNum1,2);
    fprintf("��%d�����ѽ���",i);
    sit(temp(PathNum1,2))=PathNum1*100+10;          %����λ������
    temp=[0,0];
    ReceivWait=1;
    i=i+1;
end
else                                                %���ʱ��û��
    ReceivWait=0;                                   %����λ�ú�ʱ��
    sit(temp(PathNum1,2),1)=1;
    

end
if  ReceivWait==1                               %�������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�Ŵ��㷨�Ľ�
if PathReturn(1,1)~=0  &&  X1(aa)==1                       %�ж����س����г�

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    ReturnNumber=ReturnNumber+1;                %���س�������һ

    ReturnSpendTime=[24,18,12,6,12,18];         %�ӳ����������������ʱ��
    temp=find(PathMat(:,1)==0);                 %Ѱ�ҿ��г���
    [k,~]=min(ReturnSpendTime(temp)) ;          %����ѡ��
    k=temp(find(ReturnSpendTime(temp)==k));             
    PathNum1=k(1);                              %����PathNum
   
    TempTime=time+ReturnSpendTime(PathNum1);    %����ʱ��
    


    a=PathReturnNum(1,1);
   
    temp=zeros(6,2);    
   type=zeros(800,2);

          type(i+ReturnNumber,1)=types(CarModel(a), Power(a), Drive(a),a);      %�������ͷ���type

    temp(PathNum1,1)=type(i+ReturnNumber,1);                             %����ȴ�����
    temp(PathNum1,2)=a;
    sit(temp(PathNum1,2),1)=1;
    i=i-1;
PathReturnNum(1,1)=0;
    PathReturn(1,1)=0; 
    
    
else                                 %%��ѡ�񷵻ص�·
    if(i<319)
    ReturnSpendTime=[18,12,6,0,12,18];          %�ӳ����������������ʱ��
    
  
    temp=find(PathMat(:,1)==0);                     %Ѱ�ҿ��г���
    [k,~]=min(ReturnSpendTime(temp))      ;    %����ѡ��
    k=temp(find(ReturnSpendTime(temp)==k));
    PathNum1=k(1);

    TempTime=time+ReturnSpendTime(PathNum1);


   
     temp=zeros(6,2);    
    type=zeros(800,2);

    type(i+ReturnNumber,1)=types(CarModel(i), Power(i), Drive(i),i);      %�������ͷ���type
    if type(i+ReturnNumber,2)==0
        type(i+ReturnNumber,2)=i;
    end
    temp(PathNum1,:)=type(i+ReturnNumber,:);                             %����ȴ�����
   
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