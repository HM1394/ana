%按分析任务点的价格compl_Mission_price,任务完成情况compl_Mission，与dis_limit2公里范围内任务数stat_Mission_Count、平均价格stat_Misssion_Mean,总价格stat_Mission_Sum,并记录在stat_Mission数据文件内
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='m1';%已结束项目任务数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
token='stat_count_limit_Member_Distance_Credit';                                     %记录离任务点距离最近的一定数量的有效会员的统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'count_limit_Member_Distance','count_limit_Member_Credit','stat_count_limit_Member_Credit_Median',...
    'stat_count_limit_Member_Credit_Sum','stat_count_limit_Member_Credit_Std','stat_count_limit_Member_Distance_Mean',...
    'stat_count_limit_Member_Distance_Sum','stat_count_limit_Member_Distance_Std');
%%
token='stat_count_limit_Mission_Distance';                                     %记录离任务点距离最近的一定数量任务的有效任务距离统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'count_limit_Mission_Distance','stat_count_limit_Mission_Distance_Mean','stat_count_limit_Mission_Distance_Sum','stat_count_limit_Mission_Distance_Std');
%%
token='stat_distance_limit_Member_density';                                     %记录离任务点一定半径范围内会员密集度、信誉度统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Credit_Mean','stat_distance_limit_Member_Credit_Sum','stat_distance_limit_Member_Credit_Std');
%%
token='stat_distance_limit_Mission_density';                                     %记录离任务点一定半径范围内任务密集度数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'stat_distance_limit_Mission_Count');
%%
%绘制指定半径内有效任务数、有效会员数的二维散点图，以任务价格分组。任务价格65-74.5区间按0.5元递增，75-85区间按5元递增。ccggggbbbbyyyymmmmmmwww
stand_compl_Mission_price=compl_Mission_price./std(compl_Mission_price);
stand_count_limit_Member_Distance_Mean=stat_count_limit_Member_Distance_Mean(:,3)./std(stat_count_limit_Member_Distance_Mean(:,3));
stand_count_limit_Mission_Distance_Mean=stat_count_limit_Mission_Distance_Mean(:,3)/std(stat_count_limit_Mission_Distance_Mean(:,3));
ansys_Data=[compl_Mission,stand_compl_Mission_price,stand_count_limit_Member_Distance_Mean,stand_count_limit_Mission_Distance_Mean];
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','价格分析图');
%gscatter(ansys_Data(:,8),ansys_Data(:,5),ansys_Data(:,2),'cgbyr','*o<+.',5)
%gplotmatrix(ansys_Data(:,6:8),ansys_Data(:,3:5),ansys_Data(:,1),'cgwww','o',5)
scatter3(ansys_Data(:,2),ansys_Data(:,3),ansys_Data(:,4),6,ansys_Data(:,1),'full','o')




%% 
% %绘制指定半径内有效任务数、有效会员数、任务价格的三维散点图，以红色*表示未完成，绿色O表示完成。
% ansys_Data1=[compl_Mission,compl_Mission_price,stat_Mission_Count,stat_Member_Count];
% figure;
% gscatter(ansys_Data1(:,7),ansys_Data1(:,5),ansys_Data1(:,1),'rb','xo');
%%
% %计算按5km半径内有效任务数统计相应的平均价格、价格标准差、符合条件的任务数、会员信誉值的值加上会员信誉的标准差，记入result_Data2矩阵。
% ansys_Data2=[compl_Mission,compl_Mission_price,stat_Mission_Count(:,2),stat_Member_Mean(:,2)+stat_Member_Std(:,2)];
% for ii=1:max(ansys_Data2(:,3))
%     log_cul_Data2=(ansys_Data2(:,3)>ii-1) & (ansys_Data2(:,3)<=ii);
%     cul_Data2=ansys_Data2(log_cul_Data2,:);
%     result_Data2(ii,1)=ii;
%     result_Data2(ii,2)=mean(cul_Data2(:,2));
%     result_Data2(ii,3)=std(cul_Data2(:,2));
%     result_Data2(ii,4)=length(cul_Data2(:,3));
%     result_Data2(ii,5)=mean(cul_Data2(:,4));
% end
%%
% ansys_Data3=[compl_Mission,compl_Mission_price,stat_Mission_Count(:,2),stat_Member_count(:,2)];
% for ii=2:max(ansys_Data3(:,3))
%     log_cul_Data3=(ansys_Data3(:,3)>ii-1.1) & (ansys_Data3(:,3)<ii);
%     cul_Data3=ansys_Data3(log_cul_Data3,:);
%     X=cul_Data3(:,2);
%     %probplot('exponential',cul_Data3(:,2));figure(gcf)   
%     gscatter(ansys_Data1(:,7),ansys_Data1(:,5),ansys_Data1(:,1),'rb','xo')
% end

