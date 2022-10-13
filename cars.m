function [CarMode3, Power3, Drive3]=cars(i)

switch(i)
    case 1
      
        CarMode3="A型车";
         Power3="混合";
         Drive3="两驱";
    case 2
   
        CarMode3="B型车";
         Power3="混合";
         Drive3="两驱";
    case 3
      
        CarMode3="A型车";
         Power3="燃油";
         Drive3="两驱";
    case 4
      
        CarMode3="B型车";
         Power3="燃油";
         Drive3="两驱";
    case 5
   
        CarMode3="A型车";
         Power3="燃油";
         Drive3="四驱";
    case 6
 
        CarMode3="B型车";
         Power3="燃油";
         Drive3="四驱";
    otherwise 
        fprintf('输入型号有误,输入的数据是%d',i );
        
        CarMode3="错误！";
         Power3="错误！";
         Drive3="错误！";
        
        
        
        
                   
end
end
