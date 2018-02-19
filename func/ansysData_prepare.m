%分析任务点的本身价格,周围任务总价格、任务密集度，会员密集度，会员信誉度与任务完成情况关系
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='m1';%已结束项目任务数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
%计算每个任务点最近的memCount_limit个会员的距离、信誉值的平均值anyCount_MemDistance_Mean，anyCount_MemCredit_Mean
%和标准差anyCount_MemDistance_Std、anyCount_MemCredit_Std,并记入anyCount_MemData文件
memCount_limit=[5,22,60];          %选择5人，22人，60人统计
anyCount_Member_DisMean=[];
anyCount_Member_DisStd=[];
anyCount_Member_CreMean=[];
anyCount_Member_CreStd=[];
for countID=1:length(memCount_limit);
    [count_limit_Member_Distance,count_limit_Member_Credit,...
          stat_count_limit_Member_Credit_Median,stat_count_limit_Member_Credit_Sum,...
          stat_count_limit_Member_Credit_Std,stat_count_limit_Member_Distance_Mean,...
          stat_count_limit_Member_Distance_Sum,stat_count_limit_Member_Distance_Std,...
          stat_count_limit_Member_Mission_Median,stat_count_limit_Member_Mission_Sum,...
          stat_count_limit_Member_Mission_Std]=stCount_MemDistance(memCount_limit(countID));
    anyCount_Member_DisMean(:,countID)=stat_count_limit_Member_Distance_Mean; 
    anyCount_Member_DisStd(:,countID)=stat_count_limit_Member_Distance_Std;
    anyCount_Member_CreMean(:,countID)=stat_count_limit_Member_Credit_Median;
    anyCount_Member_CreStd(:,countID)=stat_count_limit_Member_Credit_Std;
    anyCount_Member_MisSum(:,countID)=stat_count_limit_Member_Mission_Sum;
end
token='anyCount_MemData';                                     %记入数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
save(loadfilename,'anyCount_Member_MisSum','anyCount_Member_DisMean','anyCount_Member_DisStd','anyCount_Member_CreMean','anyCount_Member_CreStd');
%%
%计算每个任务点最近的misCount_limit个任务的距离、价格的平均值anyCount_Mission_DisMean，anyCount_Mission_PriMean
%和标准差anyCount_Mission_DisStd、anyCount_Mission_PriStd,并记入anyCount_MisData文件
misCount_limit=[2,5,10];        %选择2个任务，5个任务，10个任务
anyCount_Mission_DisMean=[];
anyCount_Mission_DisStd=[];
anyCount_Mission_PriMean=[];
anyCount_Mission_PriStd=[];
for countID=1:length(misCount_limit);
     [count_limit_Mission_Distance,         count_limit_Mission_Price,              stat_count_limit_Mission_Distance_Mean,...
        stat_count_limit_Mission_Distance_Sum,  stat_count_limit_Mission_Distance_Std,  stat_count_limit_Mission_Price_Mean,...
        stat_count_limit_Mission_Price_Sum,     stat_count_limit_Mission_Price_Std]=stCount_MisDistance(misCount_limit(countID));
    anyCount_Mission_DisMean(:,countID)=stat_count_limit_Mission_Distance_Mean; 
    anyCount_Mission_DisStd(:,countID)=stat_count_limit_Mission_Distance_Std;
    anyCount_Mission_PriMean(:,countID)=stat_count_limit_Mission_Price_Mean;
    anyCount_Mission_PriStd(:,countID)=stat_count_limit_Mission_Price_Std;
end
token='anyCount_MisData';                                     %记入数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
save(loadfilename,'anyCount_Mission_DisMean','anyCount_Mission_DisStd','anyCount_Mission_PriMean','anyCount_Mission_PriStd');
%%
%计算每个任务点为中心，misDis_limit公里为半径的圆周范围内会员的总数；会员的信誉度均值、标准差；会员距中心任务的距离的均值、标准差；会员预分配的任务数;
%任务总数；任务距中心任务距离的均值、标准差；任务价格的均值、标准差；
misDis_limit=[2,5,50]; %选择2公里，5公里，50公里
anyDis_Member_Count=[];
anyDis_Member_DisMean=[];
anyDis_Member_DisSum=[];
anyDis_Member_DisStd=[];
anyDis_Member_CreMean=[];
anyDis_Member_CreSum=[];
anyDis_Member_CreStd=[];
anyDis_Member_MisSum=[];
anyDis_Mission_Count=[];
anyDis_Mission_DisMean=[];
anyDis_Mission_DisSum=[];
anyDis_Mission_DisStd=[];
anyDis_Mission_PriMean=[];
anyDis_Mission_PriSum=[];
anyDis_Mission_PriStd=[];

for distanceID=1:length(misDis_limit);
  [stat_distance_limit_Member_Count,stat_distance_limit_Member_Credit_Mean,...
    stat_distance_limit_Member_Credit_Sum,stat_distance_limit_Member_Credit_Std,...
    stat_distance_limit_Member_Mission_Sum,stat_distance_limit_Member_Distance_Mean,...
    stat_distance_limit_Member_Distance_Sum,stat_distance_limit_Member_Distance_Std]=stDistance_MemDensity(misDis_limit(distanceID));
    
  [stat_distance_limit_Mission_Count,stat_distance_limit_Mission_price_Mean,...
    stat_distance_limit_Mission_price_Sum,stat_distance_limit_Mission_price_Std,...
    stat_distance_limit_Mission_Distance_Mean,stat_distance_limit_Mission_Distance_Sum,stat_distance_limit_Mission_Distance_Std]=stDistance_MisDensity(misDis_limit(distanceID));
    
    anyDis_Member_Count(:,distanceID)=stat_distance_limit_Member_Count;
    anyDis_Member_DisMean(:,distanceID)=stat_distance_limit_Member_Distance_Mean;
    anyDis_Member_DisSum(:,distanceID)=stat_distance_limit_Member_Distance_Sum;
    anyDis_Member_DisStd(:,distanceID)=stat_distance_limit_Member_Distance_Std;
    anyDis_Member_CreMean(:,distanceID)=stat_distance_limit_Member_Credit_Mean;
    anyDis_Member_CreSum(:,distanceID)=stat_distance_limit_Member_Credit_Sum;
    anyDis_Member_CreStd(:,distanceID)=stat_distance_limit_Member_Credit_Std;
    anyDis_Member_MisSum(:,distanceID)=stat_distance_limit_Member_Mission_Sum;
    anyDis_Mission_Count(:,distanceID)=stat_distance_limit_Mission_Count;
    anyDis_Mission_DisMean(:,distanceID)=stat_distance_limit_Mission_Distance_Mean;
    anyDis_Mission_DisSum(:,distanceID)=stat_distance_limit_Mission_Distance_Sum;
    anyDis_Mission_DisStd(:,distanceID)=stat_distance_limit_Mission_Distance_Std;
    anyDis_Mission_PriMean(:,distanceID)=stat_distance_limit_Mission_price_Mean;
    anyDis_Mission_PriSum(:,distanceID)=stat_distance_limit_Mission_price_Sum;
    anyDis_Mission_PriStd(:,distanceID)=stat_distance_limit_Mission_price_Std;
end
token='anyDis_MemData';                                     %记入数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
save(loadfilename,'anyDis_Member_Count','anyDis_Member_DisMean','anyDis_Member_DisSum',...
    'anyDis_Member_DisStd','anyDis_Member_CreMean','anyDis_Member_CreSum',...
    'anyDis_Member_CreStd','anyDis_Member_MisSum',...
    'anyDis_Mission_Count','anyDis_Mission_DisMean','anyDis_Mission_DisSum',...
    'anyDis_Mission_DisStd','anyDis_Mission_PriMean','anyDis_Mission_PriSum',...
    'anyDis_Mission_PriStd');


