function [powerNum,DriveNum]=typess( Power,Drive3)


            switch(Power)
                case  "燃油"
                  
                   powerNum=8;
                case  "混合" 
               
                    powerNum=7;
                otherwise
                    fprintf('输入动力有误!\n' )
                     powerNum=0;
            end
            
            switch(Drive3)
                case  "两驱"
                   
                  DriveNum=9;
                case  "四驱" 
                    
                    DriveNum=0;
                otherwise
                    fprintf('输入动力有误!\n' )
                    DriveNum=5;
            end
 
end






