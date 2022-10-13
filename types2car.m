function [ PowerNum, DriveNum]=types2car(i)

switch(i)
    case 1

         PowerNum=0;
         DriveNum=2;
    case 2

         PowerNum=0;
         DriveNum=2;
    case 3

         PowerNum=1;
         DriveNum=2;
    case 4

         PowerNum=1;
         DriveNum=2;
    case 5

         PowerNum=1;
         DriveNum=2;
    case 6

         PowerNum=1;
         DriveNum=4;
    otherwise 
        fprintf('输入型号有误,输入的数据是%d',i );
        

         PowerNum="NaN";
         DriveNum="NaN";
        
        
        
        
                   
end
end