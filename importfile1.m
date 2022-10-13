function [num, CarModel, Power, Drive] = importfile1(workbookFile, sheetName, dataLines)
%IMPORTFILE ������ӱ���е�����
%  [NUM, CARMODEL, POWER, DRIVE] = IMPORTFILE(FILE) ��ȡ��Ϊ FILE ��
%  Microsoft Excel ���ӱ���ļ��ĵ�һ�Ź������е����ݡ�  ����������ʽ�������ݡ�
%
%  [NUM, CARMODEL, POWER, DRIVE] = IMPORTFILE(FILE, SHEET) ��ָ���Ĺ������ж�ȡ��
%
%  [NUM, CARMODEL, POWER, DRIVE] = IMPORTFILE(FILE, SHEET,
%  DATALINES)��ָ�����м����ȡָ���������е����ݡ����ڲ��������м�����뽫 DATALINES ָ��Ϊ������������ N��2
%  �������������顣
%
%  ʾ��:
%  [num, CarModel, Power, Drive] = importfile1("D:\math model\����1.xlsx", "Sheet1", [2, 319]);
%
%  ������� READTABLE��
%
% �� MATLAB �� 2022-10-06 13:21:29 �Զ�����

%% ���봦��

% ���δָ���������򽫶�ȡ��һ�Ź�����
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% ���δָ���е������յ㣬��ᶨ��Ĭ��ֵ��
if nargin <= 2
    dataLines = [2, 319];
end

%% ���õ���ѡ���������
opts = spreadsheetImportOptions("NumVariables", 4);

% ָ��������ͷ�Χ
opts.Sheet = sheetName;
opts.DataRange = "A" + dataLines(1, 1) + ":D" + dataLines(1, 2);

% ָ�������ƺ�����
opts.VariableNames = ["num", "CarModel", "Power", "Drive"];
opts.VariableTypes = ["double", "string", "string", "string"];

% ָ����������
opts = setvaropts(opts, ["CarModel", "Power", "Drive"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["CarModel", "Power", "Drive"], "EmptyFieldRule", "auto");

% ��������
tbl = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = "A" + dataLines(idx, 1) + ":D" + dataLines(idx, 2);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    tbl = [tbl; tb]; %#ok<AGROW>
end

%% ת��Ϊ�������
num = tbl.num;
CarModel = tbl.CarModel;
Power = tbl.Power;
Drive = tbl.Drive;
end