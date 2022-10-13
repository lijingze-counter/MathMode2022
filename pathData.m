function [PathReturnNum,sit,PathMatNum]=pathData(PathReturnNum,PathMatNum,time,n,sit)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%path函数道路1-6从接车横移机接收车辆
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 if (mod(time,9)==0)     %九秒左移动
        for i=1:9
            if PathReturnNum(i)==0
                PathReturnNum(i)=PathReturnNum(i+1);
                PathReturnNum(i+1)=0;
            end
        end
 end
    
if (mod(time,9)==0)
for i = 6:-1:1
   for j = 10:-1:2
      if PathMatNum(i,j)==0
         temp =PathMatNum(i,j-1);
         PathMatNum(i,j)=temp;
         PathMatNum(i,j-1)=0;
         
      end 
   end
end
end


for a=1:n
    if find(PathMatNum==a)~=0
        
        
        b=find(PathMatNum==a);
        
       

        na=mod(b,6);         %行
            if na==0
                na=6;
            end
        m=11-((b-na)/6+1);            %列
%         fprintf("M=%d\n",m);
%         fprintf("na*100+m=%d\n",na*100+m);
        if m==10
            sit(a,1)=na*100+m;
        else
            sit(a,1)=na*10+m;
        end
    else
        if sit(a,1)==3
        else
        
        sit(a,1)=0;
        end
    end

    if find(PathReturnNum==a)~=0
        
        
        b=find(PathReturnNum==a);
        
        
        b=11-b;

        if b==10
            sit(a,1)=710;
        else
            sit(a,1)=70+b;
        end
    else
        if sit(a,1)==3
        else
        
        
        end
    end








end
end



