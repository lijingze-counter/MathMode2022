function type=types(CarModel, Power, Drive,i)
fprintf("�� %d ����׼���� ",i)
switch(Drive)
   case  "����"
      switch(CarModel)
        case  "A"
            switch(Power)
                case  "ȼ��"
                   
                   type=3;
                case  "�춯" 
                  
                    type=1;
                otherwise
                    fprintf('���붯������!\n' )
            end
         case  "B" 
                switch(Power)
                    case  "ȼ��"
                    
                        type=4;
                    case  "�춯" 
                   
                        type=2;
                    otherwise
                        fprintf('���붯������!\n' )
                end
         otherwise
            fprintf('���복������!\n' )
       end
   case  "����" 
      switch(CarModel)
        case  "A"
        
             type=5;
         case  "B" 
      
            type=6;
         otherwise
            fprintf('���복������!\n' )
       end
   otherwise
       fprintf('������������!\n' )
end






