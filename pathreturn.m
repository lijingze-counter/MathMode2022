function [PathReturn]=pathreturn(PathReturn,time)
    if (mod(time,9)==0)     %æ≈√Î◊Û“∆∂Ø
        for i=1:9
            if PathReturn(i)==0
                PathReturn(i)=PathReturn(i+1);
                PathReturn(i+1)=0;
            end
        end
    end
    
                
    
    
    
    










end