%��ͳ�Ʒ���������ܱ���Ч��Ա��ƽ�����룬dis_limit1���ﷶΧ�ڻ�Ա������stat_Member_Count��ƽ��ֵstat_Member_Mean����׼��stat_Member_Std,����¼��stat_Member�����ļ���
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
count_limit1=7;          %��һ��Ч��Ա��
for id=1:length(mission_Member_Distance(:,1))
    mid_Valid_Member=[mission_Member_Distance(id,:);mid_Member_Credit]';
    s1=sortrows(mid_Valid_Member,1);
    s=s1';
    valid_Member_Mission=s(:,1:count_limit1);
    stat_valid_Member_Credit(id,1)=median(valid_Member_Mission(2,:));
    stat_valid_Member_Distance_Mean(id,1)=median(valid_Member_Mission(1,:));
    stat_valid_Member_Distance_Sum(id,1)=sum(valid_Member_Mission(1,:));
    stat_valid_Member_Distance_Std(id,1)=std(valid_Member_Mission(1,:));
end
count_limit2=8;          %��һ��Ч��Ա��
for id=1:length(mission_Member_Distance(:,1))
    mid_Valid_Member=[mission_Member_Distance(id,:);mid_Member_Credit]';
    s1=sortrows(mid_Valid_Member,1);
    s=s1';
    valid_Member_Mission=s(:,1:count_limit2);
    stat_valid_Member_Credit(id,2)=median(valid_Member_Mission(2,:));
    stat_valid_Member_Distance_Mean(id,2)=median(valid_Member_Mission(1,:));
    stat_valid_Member_Distance_Sum(id,2)=sum(valid_Member_Mission(1,:));
    stat_valid_Member_Distance_Std(id,2)=std(valid_Member_Mission(1,:));
end
count_limit3=9;          %��һ��Ч��Ա��
for id=1:length(mission_Member_Distance(:,1))
    mid_Valid_Member=[mission_Member_Distance(id,:);mid_Member_Credit]';
    s1=sortrows(mid_Valid_Member,1);
    s=s1';
    valid_Member_Mission=s(:,1:count_limit3);
    stat_valid_Member_Credit(id,3)=median(valid_Member_Mission(2,:));
    stat_valid_Member_Distance_Mean(id,3)=median(valid_Member_Mission(1,:));
    stat_valid_Member_Distance_Sum(id,3)=sum(valid_Member_Mission(1,:));
    stat_valid_Member_Distance_Std(id,3)=std(valid_Member_Mission(1,:));
end
token='stat_Member_Distance';                                     %��¼������ܱ���Ч��Ա��ƽ������������ͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_valid_Member_Credit','stat_valid_Member_Distance_Mean','stat_valid_Member_Distance_Sum','stat_valid_Member_Distance_Std');

