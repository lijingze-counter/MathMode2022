function PathMat=path(PathMat,time)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%path������·1-6�ӽӳ����ƻ����ճ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (mod(time,9)==0)
for i = 6:-1:1
   for j = 10:-1:2
      if PathMat(i,j)==0
         temp =PathMat(i,j-1);
         PathMat(i,j)=temp;
         PathMat(i,j-1)=0;
         
      end 
   end
end
end








