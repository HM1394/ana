%统计分每个任务点dis_limit公里范围内任务数stat_distance_limit_Mission_Count，反映任务密集度；并记录在stat_distance_limit_Mission数据文件内。
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%已结束项目任务数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
dis_limit1=3;          %第一有效距离
log_dis_limit_Mission=(mission_Distance-dis_limit1)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    %取有效距离内的有效任务的距离集合，并计数
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,1)=length(valid_Mission_Distance)-1;
end
dis_limit2=15;          %第二有效距离
log_dis_limit_Mission=(mission_Distance-dis_limit2)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,2)=length(valid_Mission_Distance);    
end
dis_limit3=30;          %第三有效距离
log_dis_limit_Mission=(mission_Distance-dis_limit3)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,3)=length(valid_Mission_Distance);    
end
token='stat_distance_limit_Mission_density';                                     %记录每个任务点确定距离半径范围内任务密集度文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_distance_limit_Mission_Count');