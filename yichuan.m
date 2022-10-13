%关注微信公众号：您好啊数模君，免费白嫖算法和比赛思路
opt_minmax=-1;     %目标优化类型：1最大化、-1最小化
num_ppu=50;        %种群规模：个体个数
num_gen=60;        %最大遗传代数
len_ch=20;         %基因长度
gap=0.9;           %代沟
sub=100;            %变量取值下限
up=1;            %变量取值上限
cd_gray=1;         %是否选择格雷编码方式：1是0否
sc_log=0;          %是否选择对数标度：1是0否
trace=zeros(num_gen,2);   %遗传迭代性能跟踪器，生成60行2列0矩阵
fieldd=[len_ch;sub;up;1-cd_gray;sc_log;1;1];   %区域描述器
chrom=crtbp(num_ppu,len_ch); %初始化生成种群，生成一个50*20的矩阵，矩阵元素是0-1随机数
k_gen=0;%初始化遗传次数
x=bs2rv(chrom,fieldd);                 %翻译初始化种群为10进制
fun_v=fun_sigv(x);                     %计算目标函数值

hold on
while k_gen<num_gen
    fit_v=ranking(-opt_minmax*fun_v);        %计算目标函数的适应度
%Ranking 函数为查询结果数据集分区中的每一行，并返回一个序列值。依据此函数，一些可能行可能取得和其他行一样的序列值
    selchrom=select('rws',chrom,fit_v,gap);  %使用轮盘度方式选择
    selchrom=recombin('xovsp',selchrom);     %交叉
    selchrom=mut(selchrom);                  %变异
    x=bs2rv(selchrom,fieldd);                %子代个体翻译
    fun_v_sel=fun_sigv(x);                  %计算子代个体对应目标函数值   
    [chrom,fun_v]=reins(chrom,selchrom,1,1,opt_minmax*fun_v,opt_minmax*fun_v_sel);  %根据目标函数值将子代个体插入新种群，如果不设置代沟则无该步骤    
    [f,id]=max(fun_v);                    %寻找当前种群最优解
    x=bs2rv(chrom,fieldd);            %翻译初始化种群为10进制
    f=f*opt_minmax;
    fun_v=fun_v*opt_minmax;
    k_gen=k_gen+1;%记录遗传次数
    trace(k_gen,1)=f;
    trace(k_gen,2)=mean(fun_v);
end
plot(x(id),f,'r*')
figure
plot(trace(:,1),'r-*')
hold on
plot(trace(:,2),'b-o')
legend('各子代种群最优解','各子代种群平均值')
xlabel('迭代次数')
ylabel('目标函数优化情况')
title('一元函数优化过程')