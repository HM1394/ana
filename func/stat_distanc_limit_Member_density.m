%ͳ�Ʒ���ÿ�������dis_limit����뾶��Χ�ڻ�Ա������stat_distance_limit_Member_Count,��ӳ��Ч��Ա�ܼ��ȡ�
%ͳ����Ӧ��ƽ��������stat_distance_limit_Member_Mean���ܺ�stat_distance_limit_Member_Sum����׼��stat_distance_limit_Member_Std,����¼��stat_distance_limit_Member_density�����ļ���
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
dis_limit1=3;          %��һ��Ч����
log_dis_limit_Member=(mission_Member_Distance-dis_limit1)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
   %ȡ��Ч�����ڵ���Ч��Ա�ľ��뼯�ϣ�������
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Count(id,1)=length(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Mean(id,1)=mean(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Sum(id,1)=sum(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Std(id,1)=std(valid_Member_Credit);
end
dis_limit2=15;          %�ڶ���Ч����
log_dis_limit_Member=(mission_Member_Distance-dis_limit2)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Count(id,2)=length(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Mean(id,2)=mean(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Std(id,2)=std(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Sum(id,2)=sum(valid_Member_Credit);
end
dis_limit3=30;          %������Ч����
log_dis_limit_Member=(mission_Member_Distance-dis_limit3)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Count(id,3)=length(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Mean(id,3)=mean(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Sum(id,3)=sum(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Std(id,3)=std(valid_Member_Credit);
end
token='stat_distance_limit_Member_density';                                     %��¼�����һ���뾶��Χ�ڻ�Ա�ܼ��ȡ�������ͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Credit_Mean','stat_distance_limit_Member_Credit_Sum','stat_distance_limit_Member_Credit_Std');

