function [powerNum,DriveNum]=typess( Power,Drive3)


            switch(Power)
                case  "ȼ��"
                  
                   powerNum=8;
                case  "���" 
               
                    powerNum=7;
                otherwise
                    fprintf('���붯������!\n' )
                     powerNum=0;
            end
            
            switch(Drive3)
                case  "����"
                   
                  DriveNum=9;
                case  "����" 
                    
                    DriveNum=0;
                otherwise
                    fprintf('���붯������!\n' )
                    DriveNum=5;
            end
 
end






