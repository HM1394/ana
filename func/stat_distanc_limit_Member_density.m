%统计分析每个任务点dis_limit公里半径范围内会员的人数stat_distance_limit_Member_Count,反映有效会员密集度。
%统计相应的平均信誉度stat_distance_limit_Member_Mean、总和stat_distance_limit_Member_Sum、标准差stat_distance_limit_Member_Std,并记录在stat_distance_limit_Member_density数据文件内
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%会员信息数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
dis_limit1=3;          %第一有效距离
log_dis_limit_Member=(mission_Member_Distance-dis_limit1)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
   %取有效距离内的有效会员的距离集合，并计数
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Count(id,1)=length(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Mean(id,1)=mean(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Sum(id,1)=sum(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Std(id,1)=std(valid_Member_Credit);
end
dis_limit2=15;          %第二有效距离
log_dis_limit_Member=(mission_Member_Distance-dis_limit2)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Count(id,2)=length(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Mean(id,2)=mean(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Std(id,2)=std(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Sum(id,2)=sum(valid_Member_Credit);
end
dis_limit3=30;          %第三有效距离
log_dis_limit_Member=(mission_Member_Distance-dis_limit3)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Count(id,3)=length(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Mean(id,3)=mean(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Sum(id,3)=sum(valid_Member_Credit);
    stat_distance_limit_Member_Credit_Std(id,3)=std(valid_Member_Credit);
end
token='stat_distance_limit_Member_density';                                     %记录任务点一定半径范围内会员密集度、信誉度统计数据文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Credit_Mean','stat_distance_limit_Member_Credit_Sum','stat_distance_limit_Member_Credit_Std');

