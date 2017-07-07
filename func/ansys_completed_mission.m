%分析任务点的本身价格,周围任务总价格、任务密集度，会员密集度，会员信誉度与任务完成情况关系
% clear all
% pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
% %%
% token='m1';%已结束项目任务数据文件
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'compl_Mission_price','compl_Mission','compl_Mission_ID');
% %%
% %计算每个任务点最近的count_limit个会员的平均距离组成stat_count_limit_Member_Distance_Mean，取其最大值作为每个任务分析的半径限额dis_limit
% count_limit=4;
% stCount_MemDistance(count_limit);
% token='stCount_MemDistance';                                     %记录离任务点距离最近的一定数量的有效会员的统计数据文件
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'count_limit_Member_Distance','count_limit_Member_Credit','stat_count_limit_Member_Credit_Median',...
%     'stat_count_limit_Member_Credit_Sum','stat_count_limit_Member_Credit_Std','stat_count_limit_Member_Distance_Mean',...
%     'stat_count_limit_Member_Distance_Sum','stat_count_limit_Member_Distance_Std');
% dis_limit=ceil(mean(stat_count_limit_Member_Distance_Mean)+std(stat_count_limit_Member_Distance_Mean));
% %%
% %计算每个任务点为中心，dis_limit公里为半径的圆周范围内会员的总数、会员的信誉度总数
% stDistance_MemDensity(dis_limit);
% token='stDistance_MembDensity';                                     %记录离任务点一定半径范围内会员密集度、信誉度统计数据文件
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Credit_Mean',...
%     'stat_distance_limit_Member_Credit_Sum','stat_distance_limit_Member_Credit_Std',...
%     'stat_distance_limit_Member_Mission_Sum','stat_distance_limit_Member_Distance_Mean');
% %%
% %计算每个任务点为中心，dis_limit公里为半径的圆周范围内任务总数、任务总价格
% stDistance_MisDensity(dis_limit)
% token='stDistance_MisDensity';                                     %记录离任务点一定半径范围内任务密集度数据文件
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'stat_distance_limit_Mission_Count','stat_distance_limit_Mission_price_Mean',...
%     'stat_distance_limit_Mission_price_Sum','stat_distance_limit_Mission_price_Std','stat_distance_limit_Mission_Distance_Mean');
% %%
% %任务价格、会员密集度、会员信誉总值、任务密集度、任务总价格等数据标准化
% stand_compl_Mission_price=compl_Mission_price./std(compl_Mission_price);
% stand_distance_limit_Member_Count=stat_distance_limit_Member_Count./std(stat_distance_limit_Member_Count);
% stand_distance_limit_Member_Credit_Sum=stat_distance_limit_Member_Credit_Sum/std(stat_distance_limit_Member_Credit_Sum);
% stand_distance_limit_Member_Distance_Mean=stat_distance_limit_Member_Distance_Mean./...
%     std(stat_distance_limit_Member_Distance_Mean(~isnan(stat_distance_limit_Member_Distance_Mean)));
% stand_distance_limit_Member_Mission_Sum=stat_distance_limit_Member_Mission_Sum./std(stat_distance_limit_Member_Mission_Sum);
% stand_distance_limit_Mission_Count=stat_distance_limit_Mission_Count./std(stat_distance_limit_Mission_Count);
% stand_distance_limit_Mission_price_Sum=stat_distance_limit_Mission_price_Sum/std(stat_distance_limit_Mission_price_Sum);
% stand_distance_limit_Mission_Distance_Mean=stat_distance_limit_Mission_Distance_Mean./...
%     std(stat_distance_limit_Mission_Distance_Mean(~isnan(stat_distance_limit_Mission_Distance_Mean)));
% %构造分析参数矩阵
% ansys_Data=[compl_Mission,stand_compl_Mission_price,...
%     stand_distance_limit_Member_Count,stand_distance_limit_Member_Credit_Sum,...
%     stand_distance_limit_Member_Distance_Mean,stand_distance_limit_Member_Mission_Sum,...
%     stand_distance_limit_Mission_Count,stand_distance_limit_Mission_price_Sum,...
%     stand_distance_limit_Mission_Distance_Mean];
%%
%绘制指定半径内有效任务数、有效会员数的二维散点图，以任务价格分组。任务价格65-74.5区间按0.5元递增，75-85区间按5元递增。ccggggbbbbyyyymmmmmmwww
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','价格分析图');
%gscatter(ansys_Data(:,8),ansys_Data(:,5),ansys_Data(:,2),'cgbyr','*o<+.',5)
%gplotmatrix(ansys_Data(:,6:8),ansys_Data(:,3:5),ansys_Data(:,1),'cgwww','o',5)
scatter3(ansys_Data(:,6),ansys_Data(:,7),ansys_Data(:,9),6,ansys_Data(:,1),'full','o')




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

