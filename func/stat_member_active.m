%按统计分析任务点周dis_limit1公里范围内会员的人数stat_Member_Count、平均值stat_Member_Mean、标准差stat_Member_Std,并记录在stat_Member数据文件内
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='distance_value';%距离参数数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance');
token='m2';%会员信息数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
mid_Member_Credit=member_Credit';
dis_limit1=1;          %第一有效距离
s=(mission_Member_Distance-dis_limit1)<0;
for id=1:length(s(:,1))
    valid_Member_Credit=mid_Member_Credit(s(id,:));
    stat_Member_Count(id,1)=length(valid_Member_Credit);
    stat_Member_Mean(id,1)=mean(valid_Member_Credit);
    stat_Member_Sum(id,1)=sum(valid_Member_Credit);
    stat_Member_Std(id,1)=std(valid_Member_Credit);
end
dis_limit2=5;          %第二有效距离
s=(mission_Member_Distance-dis_limit2)<0;
for id=1:length(s(:,1))
    valid_Member_Credit=mid_Member_Credit(s(id,:));
    stat_Member_Count(id,2)=length(valid_Member_Credit);
    stat_Member_Mean(id,2)=mean(valid_Member_Credit);
    stat_Member_Std(id,2)=std(valid_Member_Credit);
    stat_Member_Sum(id,2)=sum(valid_Member_Credit);
end
dis_limit3=15;          %第三有效距离
s=(mission_Member_Distance-dis_limit3)<0;
for id=1:length(s(:,1))
    valid_Member_Credit=mid_Member_Credit(s(id,:));
    stat_Member_Count(id,3)=length(valid_Member_Credit);
    stat_Member_Mean(id,3)=mean(valid_Member_Credit);
    stat_Member_Sum(id,3)=sum(valid_Member_Credit);
    stat_Member_Std(id,3)=std(valid_Member_Credit);
end
token='stat_Member';                                     %记录任务点一定范围内会员信誉统计数据文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_Member_Count','stat_Member_Mean','stat_Member_Sum','stat_Member_Std');

