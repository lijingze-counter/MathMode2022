function Fraction= costfunction(O2,O3,time,cut3)
cut1=-1;
for i=1:315   
     if O2(i,1)==8
         cut1=cut1;
     elseif O2(i,1)==7&&O2(i+1,1)==8&&O2(i+2,1)==8&&O2(i+3,1)==7
         cut1=cut1;
     else 
         cut1=cut1+1;
     end
end


%优化目标2：四驱与两驱不满�?1�?1的次数为 cut2 �?
%先假设已知第�?辆为两驱�?
count1=0;   count2=0;   count3=0;   count4=0;   cut2=0;
for i=1:317
     if O3(i,1)==9
         count1=count1+1;
     elseif O3(i,1)==0&&O3(i+1,1)==0
         count2=count2+1;
     elseif O3(i,1)==0&&O3(i+1,1)==9
         count2=count2+1;
         count3=count1;
         count4=count2;
         count1=0;   count2=0;
         if count3~=count4
             cut2=cut2+1;
         end
     end
end


%优化目标3：返回道使用次数�? cut3 �?
%先假设为10�?



%优化目标4：时间惩罚�?�为 cut4
%时间先假设为100

cut4=0.01*(time-9*318-72);

%总代价函数costfunction
Fraction = 0.4*(100-cut1) + 0.3*(100-cut2) + 0.2*(100-cut3) + 0.1*(100-cut4);
