%ͳ�Ʒ���ÿ�������Ϊ���Ĵչ�count_limit����Ա��ɻ�Ա�������ݼ��Ϻͻ�Ա����ֵ���ݼ��ϣ���Ա�������ݼ��Ϻͻ�Ա����ֵ���ݼ��ϰ���������������������
%�ֱ�����Ա������λ��stat_count_limit_Member_Credit_Median,�ܺ�stat_count_limit_Member_Credit_Sum,��׼��stat_count_limit_Member_Credit_Std��
%��Ա����ƽ����stat_count_limit_Member_Distance_Mean,�ܺ�stat_count_limit_Member_Distance_Sum,��׼��stat_count_limit_Member_Distance_Std��
%����¼��stat_count_limit_Member_Distance_Credit�����ļ��ڡ�

clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
count_limit1=10;          %��һ��Ч��Ա��
for id=1:length(mission_Member_Distance(:,1))
    mid_Valid_Member=[mission_Member_Distance(id,:);mid_Member_Credit]';
    s1=sortrows(mid_Valid_Member,1);
    s=s1';
    valid_Member_Mission=s(:,1:count_limit1);
    stat_count_limit_Member_Credit_Median(id,1)=median(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Sum(id,1)=sum(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Std(id,1)=std(valid_Member_Mission(2,:));
    stat_count_limit_Member_Distance_Mean(id,1)=median(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Sum(id,1)=sum(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Std(id,1)=std(valid_Member_Mission(1,:));
end
count_limit2=50;          %�ڶ���Ч��Ա��
for id=1:length(mission_Member_Distance(:,1))
    mid_Valid_Member=[mission_Member_Distance(id,:);mid_Member_Credit]';
    s1=sortrows(mid_Valid_Member,1);
    s=s1';
    valid_Member_Mission=s(:,1:count_limit2);
    stat_count_limit_Member_Credit_Median(id,2)=median(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Sum(id,2)=sum(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Std(id,2)=std(valid_Member_Mission(2,:));
    stat_count_limit_Member_Distance_Mean(id,2)=median(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Sum(id,2)=sum(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Std(id,2)=std(valid_Member_Mission(1,:));
end
count_limit3=100;          %������Ч��Ա��
for id=1:length(mission_Member_Distance(:,1))
    mid_Valid_Member=[mission_Member_Distance(id,:);mid_Member_Credit]';
    s1=sortrows(mid_Valid_Member,1);
    s=s1';
    valid_Member_Mission=s(:,1:count_limit3);
    stat_count_limit_Member_Credit_Median(id,3)=median(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Sum(id,3)=sum(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Std(id,3)=std(valid_Member_Mission(2,:));
    stat_count_limit_Member_Distance_Mean(id,3)=median(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Sum(id,3)=sum(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Std(id,3)=std(valid_Member_Mission(1,:));
    count_limit_Member_Distance(id,:)=valid_Member_Mission(1,:);%ȡ������Ч��Ա���޶�Ļ�Ա��������ľ���ֵ����valid_Mission3������count_limit_Member_Distance����Ϊ����ģ���������
    count_limit_Member_Credit(id,:)=valid_Member_Mission(2,:);%ȡ������Ч��Ա���޶�Ļ�Ա�������������ֵ����valid_Mission3������count_limit_Member_Credit����Ϊ����ģ���������
end
token='stat_count_limit_Member_Distance_Credit';                                     %��¼������ܱ���Ч��Ա��ͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'count_limit_Member_Distance','count_limit_Member_Credit','stat_count_limit_Member_Credit_Median','stat_count_limit_Member_Credit_Sum','stat_count_limit_Member_Credit_Std','stat_count_limit_Member_Distance_Mean','stat_count_limit_Member_Distance_Sum','stat_count_limit_Member_Distance_Std');
