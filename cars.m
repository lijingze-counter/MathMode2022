function [CarMode3, Power3, Drive3]=cars(i)

switch(i)
    case 1
      
        CarMode3="A�ͳ�";
         Power3="���";
         Drive3="����";
    case 2
   
        CarMode3="B�ͳ�";
         Power3="���";
         Drive3="����";
    case 3
      
        CarMode3="A�ͳ�";
         Power3="ȼ��";
         Drive3="����";
    case 4
      
        CarMode3="B�ͳ�";
         Power3="ȼ��";
         Drive3="����";
    case 5
   
        CarMode3="A�ͳ�";
         Power3="ȼ��";
         Drive3="����";
    case 6
 
        CarMode3="B�ͳ�";
         Power3="ȼ��";
         Drive3="����";
    otherwise 
        fprintf('�����ͺ�����,�����������%d',i );
        
        CarMode3="����";
         Power3="����";
         Drive3="����";
        
        
        
        
                   
end
end
