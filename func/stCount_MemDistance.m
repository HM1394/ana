%统计分析每个任务点为中心凑够count_limit个会员组成会员距离数据集合和会员信誉值数据集合，会员距离数据集合和会员信誉值数据集合按与任务点距离作升序排序。
%分别计算会员信誉中位数stat_count_limit_Member_Credit_Median,总和stat_count_limit_Member_Credit_Sum,标准差stat_count_limit_Member_Credit_Std；
%会员距离平均数stat_count_limit_Member_Distance_Mean,总和stat_count_limit_Member_Distance_Sum,标准差stat_count_limit_Member_Distance_Std。
%并记录在stat_count_limit_Member_Distance_Credit数据文件内。
function [count_limit_Member_Distance,count_limit_Member_Credit,...
          stat_count_limit_Member_Credit_Median,stat_count_limit_Member_Credit_Sum,...
          stat_count_limit_Member_Credit_Std,stat_count_limit_Member_Distance_Mean,...
          stat_count_limit_Member_Distance_Sum,stat_count_limit_Member_Distance_Std,...
          stat_count_limit_Member_Mission_Median,stat_count_limit_Member_Mission_Sum,...
          stat_count_limit_Member_Mission_Std]=stCount_MemDistance(count_limit)
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%会员信息数据文件名
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
    count_limit_Member_Distance(id,:)=valid_Member_Mission(1,:);%取第三有效会员数限额的会员距离升序的距离值矩阵valid_Mission3，记入count_limit_Member_Distance，作为定价模型输入参数
    count_limit_Member_Credit(id,:)=valid_Member_Mission(2,:);%取第三有效会员数限额的会员距离升序的信誉值矩阵valid_Mission3，记入count_limit_Member_Credit，作为定价模型输入参数
end
% token='stCount_MemDistance';                                     %记录任务点周边有效会员的统计数据文件
% savefilename=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename,'count_limit_Member_Distance','count_limit_Member_Credit','stat_count_limit_Member_Credit_Median','stat_count_limit_Member_Credit_Sum','stat_count_limit_Member_Credit_Std','stat_count_limit_Member_Distance_Mean','stat_count_limit_Member_Distance_Sum','stat_count_limit_Member_Distance_Std');

