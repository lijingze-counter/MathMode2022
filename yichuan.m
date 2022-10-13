%��ע΢�Ź��ںţ����ð���ģ������Ѱ����㷨�ͱ���˼·
opt_minmax=-1;     %Ŀ���Ż����ͣ�1��󻯡�-1��С��
num_ppu=50;        %��Ⱥ��ģ���������
num_gen=60;        %����Ŵ�����
len_ch=20;         %���򳤶�
gap=0.9;           %����
sub=100;            %����ȡֵ����
up=1;            %����ȡֵ����
cd_gray=1;         %�Ƿ�ѡ����ױ��뷽ʽ��1��0��
sc_log=0;          %�Ƿ�ѡ�������ȣ�1��0��
trace=zeros(num_gen,2);   %�Ŵ��������ܸ�����������60��2��0����
fieldd=[len_ch;sub;up;1-cd_gray;sc_log;1;1];   %����������
chrom=crtbp(num_ppu,len_ch); %��ʼ��������Ⱥ������һ��50*20�ľ��󣬾���Ԫ����0-1�����
k_gen=0;%��ʼ���Ŵ�����
x=bs2rv(chrom,fieldd);                 %�����ʼ����ȺΪ10����
fun_v=fun_sigv(x);                     %����Ŀ�꺯��ֵ

hold on
while k_gen<num_gen
    fit_v=ranking(-opt_minmax*fun_v);        %����Ŀ�꺯������Ӧ��
%Ranking ����Ϊ��ѯ������ݼ������е�ÿһ�У�������һ������ֵ�����ݴ˺�����һЩ�����п���ȡ�ú�������һ��������ֵ
    selchrom=select('rws',chrom,fit_v,gap);  %ʹ�����̶ȷ�ʽѡ��
    selchrom=recombin('xovsp',selchrom);     %����
    selchrom=mut(selchrom);                  %����
    x=bs2rv(selchrom,fieldd);                %�Ӵ����巭��
    fun_v_sel=fun_sigv(x);                  %�����Ӵ������ӦĿ�꺯��ֵ   
    [chrom,fun_v]=reins(chrom,selchrom,1,1,opt_minmax*fun_v,opt_minmax*fun_v_sel);  %����Ŀ�꺯��ֵ���Ӵ������������Ⱥ����������ô������޸ò���    
    [f,id]=max(fun_v);                    %Ѱ�ҵ�ǰ��Ⱥ���Ž�
    x=bs2rv(chrom,fieldd);            %�����ʼ����ȺΪ10����
    f=f*opt_minmax;
    fun_v=fun_v*opt_minmax;
    k_gen=k_gen+1;%��¼�Ŵ�����
    trace(k_gen,1)=f;
    trace(k_gen,2)=mean(fun_v);
end
plot(x(id),f,'r*')
figure
plot(trace(:,1),'r-*')
hold on
plot(trace(:,2),'b-o')
legend('���Ӵ���Ⱥ���Ž�','���Ӵ���Ⱥƽ��ֵ')
xlabel('��������')
ylabel('Ŀ�꺯���Ż����')
title('һԪ�����Ż�����')