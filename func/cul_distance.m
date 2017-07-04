%按已完成项目任务顺序、会员原始顺序计算距离参数，数据行(row)为任务，数据列(cul）为任务或会员
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
token='m1';%会员信息数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
token='m2';%会员信息数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Lat_Lon','member_Mission_Limit','member_Mission_Begin_Time','member_Credit','member_ID');
%load(loadfilename,'new_Mission_Lat_Lon','new_Mission_ID');
for id=1:length(compl_Mission_lat_lon(:,1))                 %计算每个任务点间距离
    mission_Distance(:,id)=deg2km(distance(compl_Mission_lat_lon(id,1),compl_Mission_lat_lon(id,2),compl_Mission_lat_lon(:,1),compl_Mission_lat_lon(:,2)));    
end
for id=1:length(member_Lat_Lon(:,1))                 %计算每个任务点与会员的距离
    mission_Member_Distance(:,id)=deg2km(distance(member_Lat_Lon(id,1),member_Lat_Lon(id,2),compl_Mission_lat_lon(:,1),compl_Mission_lat_lon(:,2)));    
end
token='distance_value';                                     %记录距离参数文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'mission_Distance','mission_Member_Distance');

