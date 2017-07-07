%统计分析每个任务点为中心最近count_limit个任务组成任务距离数据集合，计算stat_Mission_Count、平均价格stat_Misssion_Mean,总价格stat_Mission_Sum；
%建立count_limit3限额的有效任务与计算任务点距离升序矩阵count_limit_Mission_Distance，并记录在stat_Mission数据文件内
function stCount_MisDistance(count_limit)
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%已结束项目任务数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
mid_Valid_Mission3=sort(mission_Distance,2);
valid_Mission3=mid_Valid_Mission3(:,2:count_limit+1);
stat_count_limit_Mission_Distance_Mean3=median(valid_Mission3,2);
stat_count_limit_Mission_Distance_Sum3=sum(valid_Mission3,2);
stat_count_limit_Mission_Distance_Std3=std(valid_Mission3,1,2);
%组成统计参数矩阵，行(row)按任务顺序，列按有效任务数顺序，作为散列点图矩阵参数
stat_count_limit_Mission_Distance_Mean=[stat_count_limit_Mission_Distance_Mean1,stat_count_limit_Mission_Distance_Mean2,stat_count_limit_Mission_Distance_Mean3];
stat_count_limit_Mission_Distance_Sum=[stat_count_limitd_Mission_Distance_Sum1,stat_count_limit_Mission_Distance_Sum2,stat_count_limit_Mission_Distance_Sum3];
stat_count_limit_Mission_Distance_Std=[stat_count_limit_Mission_Distance_Std1,stat_count_limit_Mission_Distance_Std2,stat_count_limit_Mission_Distance_Std3];
%取第三有效任务数任务距离数据矩阵valid_Mission3，记入count_limit_Mission_Distance，作为定价模型输入参数
count_limit_Mission_Distance=valid_Mission3;
token='stCount_MisDistance';                                     %记录任务点范围内一定数量任务的距离统计数据文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'count_limit_Mission_Distance','stat_count_limit_Mission_Distance_Mean','stat_count_limit_Mission_Distance_Sum','stat_count_limit_Mission_Distance_Std');


