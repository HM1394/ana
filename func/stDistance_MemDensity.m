%ͳ�Ʒ���ÿ�������dis_limit����뾶��Χ�ڻ�Ա������stat_distance_limit_Member_Count,��ӳ��Ч��Ա�ܼ��ȡ�
%ͳ����Ӧ��ƽ��������stat_distance_limit_Member_Mean���ܺ�stat_distance_limit_Member_Sum����׼��stat_distance_limit_Member_Std,����¼��stat_distance_limit_Member_density�����ļ���
function stDistance_MemDensity(dis_limit)
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Mission_Limit=member_Mission_Limit';
mid_Member_Credit=member_Credit';
log_dis_limit_Member=(mission_Member_Distance-dis_limit)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Count(id,1)=length(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Mean(id,1)=mean(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Sum(id,1)=sum(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Std(id,1)=std(valid_Member_Credit);
    valid_Member_Mission_Limit=mid_Member_Mission_Limit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Mission_Sum(id,1)=sum(valid_Member_Mission_Limit);
    mid_Member_Distance=mission_Member_Distance(id,:);
    valid_Member_Distance=mid_Member_Distance(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Distance_Mean(id,1)=mean(valid_Member_Distance);    
end
token='stDistance_MembDensity';                                     %��¼�����һ���뾶��Χ�ڻ�Ա�ܼ��ȡ�������ͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Credit_Mean',...
    'stat_distance_limit_Member_Credit_Sum','stat_distance_limit_Member_Credit_Std',...
    'stat_distance_limit_Member_Mission_Sum','stat_distance_limit_Member_Distance_Mean');

