%��ͳ�Ʒ����������dis_limit1���ﷶΧ�ڻ�Ա������stat_Member_Count��ƽ��ֵstat_Member_Mean����׼��stat_Member_Std,����¼��stat_Member�����ļ���
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
dis_limit1=1;          %��һ��Ч����
s=(mission_Member_Distance-dis_limit1)<0;
for id=1:length(s(:,1))
    valid_Member_Credit=mid_Member_Credit(s(id,:));
    stat_Member_Count(id,1)=length(valid_Member_Credit);
    stat_Member_Mean(id,1)=mean(valid_Member_Credit);
    stat_Member_Sum(id,1)=sum(valid_Member_Credit);
    stat_Member_Std(id,1)=std(valid_Member_Credit);
end
dis_limit2=5;          %�ڶ���Ч����
s=(mission_Member_Distance-dis_limit2)<0;
for id=1:length(s(:,1))
    valid_Member_Credit=mid_Member_Credit(s(id,:));
    stat_Member_Count(id,2)=length(valid_Member_Credit);
    stat_Member_Mean(id,2)=mean(valid_Member_Credit);
    stat_Member_Std(id,2)=std(valid_Member_Credit);
    stat_Member_Sum(id,2)=sum(valid_Member_Credit);
end
dis_limit3=15;          %������Ч����
s=(mission_Member_Distance-dis_limit3)<0;
for id=1:length(s(:,1))
    valid_Member_Credit=mid_Member_Credit(s(id,:));
    stat_Member_Count(id,3)=length(valid_Member_Credit);
    stat_Member_Mean(id,3)=mean(valid_Member_Credit);
    stat_Member_Sum(id,3)=sum(valid_Member_Credit);
    stat_Member_Std(id,3)=std(valid_Member_Credit);
end
token='stat_Member';                                     %��¼�����һ����Χ�ڻ�Ա����ͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_Member_Count','stat_Member_Mean','stat_Member_Sum','stat_Member_Std');

