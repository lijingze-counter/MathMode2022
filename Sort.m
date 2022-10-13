

function [ReturnSign]=Sort(OutNum,NUM,aa)

[num, CarModel, Power, Drive] = importfile1("D:\math model\附件2.xlsx", "Sheet1", [2, 319]);        %导入附件1数据


%% 0.4判断：
%   保存上一辆车型
%   判断前两个车型
%   读取下两辆车型

% 保存车型
    %出车顺序

weizhi=max(find(NUM(:,2)==OutNum));     %%%该车在NUM最后的位置
                     %%%车的序号 
                               %%%%power(车的序号)

        





%% 判断
if (weizhi+4<aa)
    if (Power(OutNum)==Power(NUM(weizhi+1,2))  &&  Power(OutNum)==Power(NUM(weizhi+2,2))) ||  (Power(num(OutNum))~=Power(NUM(weizhi+1,2)) &&  Power(num(OutNum))==Power(NUM(weizhi+2,2)) )
            ReturnSign=0;
        if Power(num(OutNum))~=Power(NUM(weizhi+3,2))

            ReturnSign=1;       %   78887 
        end
    else
  
            ReturnSign=0;
    end
else
ReturnSign=0;
end
