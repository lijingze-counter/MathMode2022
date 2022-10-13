function [PathReturnNum,sit]=pathreturnnum(PathReturnNum,sit,time,n)
    if (mod(time,9)==0)     %æ≈√Î◊Û“∆∂Ø
        for i=1:9
            if PathReturnNum(i)==0
                PathReturnNum(i)=PathReturnNum(i+1);
                PathReturnNum(i+1)=0;
            end
        end
    end
    
    
    
    for a=1:n
    if find(PathReturnNum==a)~=0
        
        
        b=find(PathReturnNum==a);
        
        b=11-b;    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        if b==10
            sit(a,1)=710;
        else
            sit(a,1)=70+b;
        end
    else
        if sit(a,1)==3
        else
        
        sit(a,1)=0;
        end
    end
    end
end