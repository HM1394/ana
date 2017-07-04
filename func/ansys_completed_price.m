%按分析任务点的价格compl_Mission_price,任务完成情况compl_Mission，与dis_limit2公里范围内任务数stat_Mission_Count、平均价格stat_Misssion_Mean,总价格stat_Mission_Sum,并记录在stat_Mission数据文件内
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='stat_Member';%记录任务点一定范围内会员信誉统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'stat_Member_Count','stat_Member_Mean','stat_Member_Sum','stat_Member_Std');
token='stat_Mission';                                      %记录任务点范围内任务价值统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'stat_Mission_Count','stat_Mission_Mean','stat_Mission_Sum','stat_Mission_Std');
token='m1';%已结束项目任务数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_price','compl_Mission','compl_Mission_ID');
s=compl_Mission<0.9;
ansys_Data1=[compl_Mission,compl_Mission_price,stat_Mission_Count,stat_Member_Count];
finish_Ansys_Data=ansys_Data1(~s,:);
unfinish_Ansys_Data=ansys_Data1(s,:);
figure
s=10;
scatter3(unfinish_Ansys_Data(:,7),unfinish_Ansys_Data(:,5),unfinish_Ansys_Data(:,2),'*','MarkerEdgeColor','r');hold on;
scatter3(finish_Ansys_Data(:,7),finish_Ansys_Data(:,5),finish_Ansys_Data(:,2),'o');

ansys_Data=[compl_Mission,compl_Mission_price,stat_Mission_Count(:,2),stat_Member_Mean(:,2)+stat_Member_Std(:,2)];
for ii=1:max(ansys_Data(:,3))
    log_cul_Data_fig=(ansys_Data(:,3)>ii-1) & (ansys_Data(:,3)<=ii);
    cul_Data_fig=ansys_Data(log_cul_Data_fig,:);
    result_Data(ii,1)=ii;
    result_Data(ii,2)=mean(cul_Data(:,2));
    result_Data(ii,3)=std(cul_Data(:,2));
    result_Data(ii,4)=length(cul_Data(:,3));
    result_Data(ii,5)=mean(cul_Data(:,4));
end

for ii=1:max(ansys_Data(:,3))
    log_cul_Data=(ansys_Data(:,3)>ii-1.1) & (ansys_Data(:,3)<ii);
    cul_Data=ansys_Data(log_cul_Data,:);
    result_Data(ii,1)=ii;
    result_Data(ii,2)=mean(cul_Data(:,2));
    result_Data(ii,3)=std(cul_Data(:,2));
    result_Data(ii,4)=length(cul_Data(:,3));
    result_Data(ii,5)=mean(cul_Data(:,4));
end

