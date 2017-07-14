%统计分析每个任务点为中心最近count_limit个任务组成任务距离数据集合，计算stat_Mission_Count、平均价格stat_Misssion_Mean,总价格stat_Mission_Sum；
%建立count_limit3限额的有效任务与计算任务点距离升序矩阵count_limit_Mission_Distance，并记录在stat_Mission数据文件内
function [count_limit_Mission_Distance,         count_limit_Mission_Price,              stat_count_limit_Mission_Distance_Mean,...
        stat_count_limit_Mission_Distance_Sum,  stat_count_limit_Mission_Distance_Std,  stat_count_limit_Mission_Price_Mean,...
        stat_count_limit_Mission_Price_Sum,     stat_count_limit_Mission_Price_Std]=stCount_MisDistance(count_limit)
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%已结束项目任务数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
mid_Mission_Price=compl_Mission_price';
for id=1:length(mission_Distance(:,1))
    mid_Valid_Mission=[mission_Distance(id,:);mid_Mission_Price]';
    s1=sortrows(mid_Valid_Mission,1);
    s=s1';
    valid_Mission=s(:,2:count_limit+1);
    stat_count_limit_Mission_Price_Mean(id,1)=median(valid_Mission(2,:));
    stat_count_limit_Mission_Price_Sum(id,1)=sum(valid_Mission(2,:));
    stat_count_limit_Mission_Price_Std(id,1)=iqr(valid_Mission(2,:));
    stat_count_limit_Mission_Distance_Mean(id,1)=median(valid_Mission(1,:));
    stat_count_limit_Mission_Distance_Sum(id,1)=sum(valid_Mission(1,:));
    stat_count_limit_Mission_Distance_Std(id,1)=iqr(valid_Mission(1,:));
    count_limit_Mission_Distance(id,:)=valid_Mission(1,:);%取有效会员数限额的会员距离升序的距离值向量，记入count_limit_Mission_Distance，作为定价模型输入参数
    count_limit_Mission_Price(id,:)=valid_Mission(2,:);%取有效会员数限额的会员距离升序的信誉值向量，记入count_limit_Mission_Price，作为定价模型输入参数
end
% token='stCount_MisDistance';                                     %记录任务点范围内一定数量任务的距离统计数据文件
% savefilename=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename,'count_limit_Mission_Distance',         'count_limit_Mission_Price',              'stat_count_limit_Mission_Distance_Mean',...
%         'stat_count_limit_Mission_Distance_Sum',  'stat_count_limit_Mission_Distance_Std',  'stat_count_limit_Mission_Price_Mean',...
%         'stat_count_limit_Mission_Price_Sum',     'stat_count_limit_Mission_Price_Std');


