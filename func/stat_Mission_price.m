%按统计分析任务点dis_limit2公里范围内任务数stat_Mission_Count、平均价格stat_Misssion_Mean,总价格stat_Mission_Sum,并记录在stat_Mission数据文件内
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%已结束项目任务数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
dis_limit1=7;          %第一有效距离
s=(mission_Distance-dis_limit1)<0;
for id=1:length(s(:,1))
    mid_Mission_price=mission_Distance(id,:);
    valid_Mission_price=mid_Mission_price(s(id,:));
    stat_Mission_Count(id,1)=length(valid_Mission_price);
    stat_Mission_Mean(id,1)=mean(valid_Mission_price);
    stat_Mission_Sum(id,1)=sum(valid_Mission_price);
    stat_Mission_Std(id,1)=std(valid_Mission_price);
end
dis_limit2=8;          %第二有效距离
s=(mission_Distance-dis_limit2)<0;
for id=1:length(s(:,1))
    valid_Mission_price=mid_Mission_price(s(id,:));
    stat_Mission_Count(id,2)=length(valid_Mission_price);
    stat_Mission_Mean(id,2)=mean(valid_Mission_price);
    stat_Mission_Sum(id,2)=sum(valid_Mission_price);
    stat_Mission_Std(id,2)=std(valid_Mission_price);
end
dis_limit3=9;          %第三有效距离
s=(mission_Distance-dis_limit3)<0;
for id=1:length(s(:,1))
    valid_Mission_price=mid_Mission_price(s(id,:));
    stat_Mission_Count(id,3)=length(valid_Mission_price);
    stat_Mission_Mean(id,3)=mean(valid_Mission_price);
    stat_Mission_Sum(id,3)=sum(valid_Mission_price);
    stat_Mission_Std(id,3)=std(valid_Mission_price);
end
token='stat_Mission';                                     %记录任务点范围内任务价值统计数据文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_Mission_Count','stat_Mission_Mean','stat_Mission_Sum','stat_Mission_Std');