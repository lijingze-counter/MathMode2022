

function [ReturnSign]=Sort(OutNum,NUM,aa)

[num, CarModel, Power, Drive] = importfile1("D:\math model\����2.xlsx", "Sheet1", [2, 319]);        %���븽��1����


%% 0.4�жϣ�
%   ������һ������
%   �ж�ǰ��������
%   ��ȡ����������

% ���泵��
    %����˳��

weizhi=max(find(NUM(:,2)==OutNum));     %%%�ó���NUM����λ��
                     %%%������� 
                               %%%%power(�������)

        





%% �ж�
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
