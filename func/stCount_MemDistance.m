%ͳ�Ʒ���ÿ�������Ϊ���Ĵչ�count_limit����Ա��ɻ�Ա�������ݼ��Ϻͻ�Ա����ֵ���ݼ��ϣ���Ա�������ݼ��Ϻͻ�Ա����ֵ���ݼ��ϰ���������������������
%�ֱ�����Ա������λ��stat_count_limit_Member_Credit_Median,�ܺ�stat_count_limit_Member_Credit_Sum,��׼��stat_count_limit_Member_Credit_Std��
%��Ա����ƽ����stat_count_limit_Member_Distance_Mean,�ܺ�stat_count_limit_Member_Distance_Sum,��׼��stat_count_limit_Member_Distance_Std��
%����¼��stat_count_limit_Member_Distance_Credit�����ļ��ڡ�
function [count_limit_Member_Distance,count_limit_Member_Credit,...
          stat_count_limit_Member_Credit_Median,stat_count_limit_Member_Credit_Sum,...
          stat_count_limit_Member_Credit_Std,stat_count_limit_Member_Distance_Mean,...
          stat_count_limit_Member_Distance_Sum,stat_count_limit_Member_Distance_Std,...
          stat_count_limit_Member_Mission_Median,stat_count_limit_Member_Mission_Sum,...
          stat_count_limit_Member_Mission_Std]=stCount_MemDistance(count_limit)
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
mid_Member_Mission_Limit=member_Mission_Limit';
for id=1:length(mission_Member_Distance(:,1))
    mid_Valid_Member=[mission_Member_Distance(id,:);mid_Member_Credit;mid_Member_Mission_Limit]';
    s1=sortrows(mid_Valid_Member,1);
    s=s1';
    valid_Member_Mission=s(:,1:count_limit);
    stat_count_limit_Member_Mission_Median(id,1)=median(valid_Member_Mission(3,:));
    stat_count_limit_Member_Mission_Sum(id,1)=sum(valid_Member_Mission(3,:));
    stat_count_limit_Member_Mission_Std(id,1)=iqr(valid_Member_Mission(3,:));
    stat_count_limit_Member_Credit_Median(id,1)=median(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Sum(id,1)=sum(valid_Member_Mission(2,:));
    stat_count_limit_Member_Credit_Std(id,1)=iqr(valid_Member_Mission(2,:));
    stat_count_limit_Member_Distance_Mean(id,1)=median(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Sum(id,1)=sum(valid_Member_Mission(1,:));
    stat_count_limit_Member_Distance_Std(id,1)=iqr(valid_Member_Mission(1,:));
    count_limit_Member_Distance(id,:)=valid_Member_Mission(1,:);%ȡ������Ч��Ա���޶�Ļ�Ա��������ľ���ֵ����valid_Mission3������count_limit_Member_Distance����Ϊ����ģ���������
    count_limit_Member_Credit(id,:)=valid_Member_Mission(2,:);%ȡ������Ч��Ա���޶�Ļ�Ա�������������ֵ����valid_Mission3������count_limit_Member_Credit����Ϊ����ģ���������
end
% token='stCount_MemDistance';                                     %��¼������ܱ���Ч��Ա��ͳ�������ļ�
% savefilename=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename,'count_limit_Member_Distance','count_limit_Member_Credit','stat_count_limit_Member_Credit_Median','stat_count_limit_Member_Credit_Sum','stat_count_limit_Member_Credit_Std','stat_count_limit_Member_Distance_Mean','stat_count_limit_Member_Distance_Sum','stat_count_limit_Member_Distance_Std');

