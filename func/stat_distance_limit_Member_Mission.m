%统计分析每个任务点dis_limit公里半径范围内会员的人数stat_distance_limit_Member_Count,有效任务数stat_distance_limit_Mission_Count,预分配任务数与有效任务数之比。
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance','mission_Distance');
%%
token='m2';%会员信息数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
%%
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
%%
token='m1';%已结束项目任务数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
mid_Member_Mission_Limit=member_Mission_Limit';
mid_Member_Credit=member_Credit';
dis_limit=50;          %有效距离
log_dis_limit_Member=(mission_Member_Distance-dis_limit)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
   %取有效距离内的有效会员的距离集合，并计数
    valid_Member_Mission_Limit=mid_Member_Mission_Limit(log_dis_limit_Member(id,:));
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Credit_Sum(id,1)=sum(valid_Member_Credit);
    stat_distance_limit_Member_Count(id,1)=length(valid_Member_Mission_Limit);
    stat_distance_limit_Member_Mission_Sum(id,1)=sum(valid_Member_Mission_Limit);   
end
log_dis_limit_Mission=(mission_Distance-dis_limit)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    %取有效距离内的有效任务的距离集合，并计数
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,1)=length(valid_Mission_Distance);
    stat_distance_limit_Mission_Distance_Mean(id,1)=mean(valid_Mission_Distance);
end
token='stat_distance_limit_Member_Mission';                                     %记录任务点一定半径范围内会员密集度、信誉度统计数据文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Mission_Sum','stat_distance_limit_Mission_Count','stat_distance_limit_Mission_Distance_Mean');
ansys_price_Data=[compl_Mission,compl_Mission_price,stat_distance_limit_Member_Credit_Sum,...
    stat_distance_limit_Mission_Distance_Mean,stat_distance_limit_Member_Mission_Sum./stat_distance_limit_Mission_Count];
%数据标准化，即数据/数据集的标准差
x=ansys_price_Data(:,3)./std(ansys_price_Data(:,3));
y=ansys_price_Data(:,2)./std(ansys_price_Data(:,2));
z=ansys_price_Data(:,5);
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','温湿度参数统计分析表');
subW2=subplot(2,1,2);
%set(subW2,'Position',[0.13 0.032 0.775 0.088]);
scatter3(x,y,z,6,ansys_price_Data(:,2),'full','o');
xlabel('信誉度总和标准值');
ylabel('平均距离标准值');
zlabel('预计任务数/实际任务数');
hold on
subW1=subplot(2,1,1);
scatter(y,ansys_price_Data(:,2));
ylabel('任务价格');
xlabel('平均距离标准值');


