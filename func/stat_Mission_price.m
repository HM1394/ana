%��ͳ�Ʒ��������dis_limit2���ﷶΧ��������stat_Mission_Count��ƽ���۸�stat_Misssion_Mean,�ܼ۸�stat_Mission_Sum,����¼��stat_Mission�����ļ���
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%�ѽ�����Ŀ���������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
dis_limit1=7;          %��һ��Ч����
s=(mission_Distance-dis_limit1)<0;
for id=1:length(s(:,1))
    mid_Mission_price=mission_Distance(id,:);
    valid_Mission_price=mid_Mission_price(s(id,:));
    stat_Mission_Count(id,1)=length(valid_Mission_price);
    stat_Mission_Mean(id,1)=mean(valid_Mission_price);
    stat_Mission_Sum(id,1)=sum(valid_Mission_price);
    stat_Mission_Std(id,1)=std(valid_Mission_price);
end
dis_limit2=8;          %�ڶ���Ч����
s=(mission_Distance-dis_limit2)<0;
for id=1:length(s(:,1))
    valid_Mission_price=mid_Mission_price(s(id,:));
    stat_Mission_Count(id,2)=length(valid_Mission_price);
    stat_Mission_Mean(id,2)=mean(valid_Mission_price);
    stat_Mission_Sum(id,2)=sum(valid_Mission_price);
    stat_Mission_Std(id,2)=std(valid_Mission_price);
end
dis_limit3=9;          %������Ч����
s=(mission_Distance-dis_limit3)<0;
for id=1:length(s(:,1))
    valid_Mission_price=mid_Mission_price(s(id,:));
    stat_Mission_Count(id,3)=length(valid_Mission_price);
    stat_Mission_Mean(id,3)=mean(valid_Mission_price);
    stat_Mission_Sum(id,3)=sum(valid_Mission_price);
    stat_Mission_Std(id,3)=std(valid_Mission_price);
end
token='stat_Mission';                                     %��¼����㷶Χ�������ֵͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_Mission_Count','stat_Mission_Mean','stat_Mission_Sum','stat_Mission_Std');