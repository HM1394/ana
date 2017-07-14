%分析任务点的本身价格,周围任务总价格、任务密集度，会员密集度，会员信誉度与任务完成情况关系
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='m1';                                                 %读取已结束项目任务数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
token='anyCount_MemData';                                     %读取以任务为中心，距离最近的一定数量的有效会员的统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'anyCount_Member_MisSum','anyCount_Member_DisMean','anyCount_Member_DisStd','anyCount_Member_CreMean','anyCount_Member_CreStd');
%%
token='anyCount_MisData';                                     %读取以任务为中心，距离最近的一定数量的任务的统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'anyCount_Mission_DisMean','anyCount_Mission_DisStd','anyCount_Mission_PriMean','anyCount_Mission_PriStd');
%%
token='anyDis_MemData';                                     %读取离任务点一定半径范围内会员、任务情况统计数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'anyDis_Member_Count','anyDis_Member_DisMean','anyDis_Member_DisSum',...
    'anyDis_Member_DisStd','anyDis_Member_CreMean','anyDis_Member_CreSum',...
    'anyDis_Member_CreStd','anyDis_Member_MisSum',...
    'anyDis_Mission_Count','anyDis_Mission_DisMean','anyDis_Mission_DisSum',...
    'anyDis_Mission_DisStd','anyDis_Mission_PriMean','anyDis_Mission_PriSum',...
    'anyDis_Mission_PriStd');
%%
token='kernel_missio_distance';                                     %读取任务聚类中心与任务的距离参数文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'kernel_mission_Distance','idx_mission','ctrs_mission');
%%
token='kernel_member_distance';                                     %读取会员聚类中心与会员的距离参数文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
load(savefilename,'kernel_member_Distance','idx_member','ctrs_member');
for id=1:length(ctrs_member(:,1))                 %计算每个任务点与会员中心的距离
    memberKernel_mission_Distance(:,id)=deg2km(distance(ctrs_member(id,1),ctrs_member(id,2),compl_Mission_lat_lon(:,1),compl_Mission_lat_lon(:,2)));    
end
%%
standData=@(input) input./repmat(nanstd(input),length(input(:,1)),1);   %数据标准化函数
stCompl_Mission_Price=compl_Mission_price./std(compl_Mission_price);    %任务价格
%定任务数、定会员数的统计数据标准化
stCount_Member_MisSum=standData(anyCount_Member_MisSum);                %定会员数的任务总数 1
stCount_Member_DisMean=standData(anyCount_Member_DisMean);              %定会员数的会员平均距离
stCount_Member_DisStd=standData(anyCount_Member_DisStd);
stCount_Member_CreMean=standData(anyCount_Member_CreMean);              %定会员数的平均信誉值 2
stCount_Member_CreStd=standData(anyCount_Member_CreStd);
stCount_Mission_DisMean=standData(anyCount_Mission_DisMean);            %定任务数的任务平均距离
stCount_Mission_DisStd=standData(anyCount_Mission_DisStd); 
stCount_Mission_PriMean=standData(anyCount_Mission_PriMean);            %定任务数的任务平均价格
stCount_Mission_PriStd=standData(anyCount_Mission_PriStd);
%定距离的统计数据标准化
stDis_Member_Count=standData(anyDis_Member_Count);                      %定距离的会员总数 3
stDis_Member_CreSum=standData(anyDis_Member_CreSum);                  %定距离的会员信誉值总和 4
stDis_Member_CreMean=standData(anyDis_Member_CreMean); 
stDis_Member_CreStd=standData(anyDis_Member_CreStd);
stDis_Member_DisSum=standData(anyDis_Member_DisSum);                  %定距离的会员距离总和
stDis_Member_DisMean=standData(anyDis_Member_DisMean);
stDis_Member_DisStd=standData(anyDis_Member_DisStd);
stDis_Member_MisSum=standData(anyDis_Member_MisSum);                    %定距离的会员所拥有的任务总数
stDis_Mission_Count=standData(anyDis_Mission_Count);                    %定距离的任务总数
stDis_Mission_PriSum=standData(anyDis_Mission_PriSum);                 %定距离的任务价格总和
stDis_Mission_PriMean=standData(anyDis_Mission_PriMean);
stDis_Mission_PriStd=standData(anyDis_Mission_PriStd);  
stDis_Mission_DisSum=standData(anyDis_Mission_DisSum);                %定距离的任务距离总和
stDis_Mission_DisMean=standData(anyDis_Mission_DisMean);
stDis_Mission_DisStd=standData(anyDis_Mission_DisStd); 
%任务聚类中心距任务距离
stKer_Mission_Distance=standData(kernel_mission_Distance); 
%会员中心与各任务的最小距离
stMemberKer_Mission_Distance=standData(min(memberKernel_mission_Distance,[],2)); 
%会员到其会员中心的距离
stKer_Member_Distance=standData(kernel_member_Distance); 
%%
token='stand_Data';                                     %读取会员聚类中心与会员的距离参数文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stCompl_Mission_Price','stCount_Member_MisSum','stCount_Member_DisMean','stCount_Member_DisStd',...
	'stCount_Member_CreMean','stCount_Member_CreStd','stCount_Mission_DisMean','stCount_Mission_DisStd',...
	'stCount_Mission_PriMean','stCount_Mission_PriStd','stDis_Member_Count','stDis_Member_CreSum','stDis_Member_CreMean','stDis_Member_CreStd',...
	'stDis_Member_DisSum','stDis_Member_DisMean','stDis_Member_DisStd','stDis_Member_MisSum','stDis_Mission_Count',...
	'stDis_Mission_PriSum','stDis_Mission_PriMean','stDis_Mission_PriStd','stDis_Mission_DisSum','stDis_Mission_DisMean','stDis_Mission_DisStd',...
	'stKer_Mission_Distance','stMemberKer_Mission_Distance','stKer_Member_Distance');

