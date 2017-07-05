%按统计分析任务点周边有效会员的平均距离，dis_limit1公里范围内会员的人数stat_Member_Count、平均值stat_Member_Mean、标准差stat_Member_Std,并记录在stat_Member数据文件内
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%会员信息数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
count_limit1=7;          %第一有效会员数
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
count_limit2=8;          %第一有效会员数
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
count_limit3=9;          %第一有效会员数
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
token='stat_Member_Distance';                                     %记录任务点周边有效会员的平均信誉、距离统计数据文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_valid_Member_Credit','stat_valid_Member_Distance_Mean','stat_valid_Member_Distance_Sum','stat_valid_Member_Distance_Std');

