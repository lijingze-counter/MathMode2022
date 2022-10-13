function type=types(CarModel, Power, Drive,i)
fprintf("第 %d 辆车准备： ",i)
switch(Drive)
   case  "两驱"
      switch(CarModel)
        case  "A"
            switch(Power)
                case  "燃油"
                   
                   type=3;
                case  "混动" 
                  
                    type=1;
                otherwise
                    fprintf('输入动力有误!\n' )
            end
         case  "B" 
                switch(Power)
                    case  "燃油"
                    
                        type=4;
                    case  "混动" 
                   
                        type=2;
                    otherwise
                        fprintf('输入动力有误!\n' )
                end
         otherwise
            fprintf('输入车型有误!\n' )
       end
   case  "四驱" 
      switch(CarModel)
        case  "A"
        
             type=5;
         case  "B" 
      
            type=6;
         otherwise
            fprintf('输入车型有误!\n' )
       end
   otherwise
       fprintf('输入驱动有误!\n' )
end






