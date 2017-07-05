%%
%读入excel格式的项目资料，并将已结束项目任务数据写入m1.mat,会员信息数据写入m2.mat,新项目任务数据写入m3.mat,原文件取掉列名行
clear all
pathRead='E:\ana\excel\';%读入excel格式的项目资料存储路径
pathWriteExcel='E:\ana\excel\';%写excel文档路径
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
%filename='m1.xlsx';%已结束项目任务数据文件名
%xlRange = 'A:E';
%[dataMission, celMission, ~] = xlsread(strcat(pathRead,filename),xlRange); %读取pathRead\filename,sheet1
%compl_Mission_lat_lon=[dataMission(:,1),dataMission(:,2)];                 %已结束任务gps纬度lat,经度lon
%compl_Mission_price=dataMission(:,3);                                      %已结束任务标价price
%compl_Mission=dataMission(:,4);                                            %已结束任务执行情况complete
%cel1=celMission(:,1);                                   
%compl_Mission_ID=char(cel1{1:length(cel1)});                               %已结束完成任务号码
%[token, remain] = strtok(filename,'.');
%savefilename1=strcat(strcat(pathWriteMat,token),'.mat');
%save(savefilename1,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%savefilename2=strcat(strcat(pathWriteExcel,token),'整理.xlsx');
%%xlswrite(savefilename2, recSD );
%%
% filename='m2.xlsx';%会员信息数据文件名
% xlRange = 'A:E';
% [dataMember, celMember, ~] = xlsread(strcat(pathRead,filename),xlRange);   %读取pathRead\filename,sheet1
% full_member_Mission_Limit=dataMember(:,1);                                      %会员预订任务限额
% full_member_Mission_Begin_Time=dataMember(:,2);                                 %预订任务开始时间
% full_member_Credit=dataMember(:,3);                                             %会员信誉值
% cel1=celMember(:,1);                                   
% full_member_ID=char(cel1{1:length(cel1)});                                      %会员编号
% cel2=celMember(:,2);
% [cel_Member_Lat, cel_Member_Lon] = strtok(cel2,' ');
% var_Member_Lat_Lon=[char(cel_Member_Lat{1:length(cel_Member_Lat)}),char(cel_Member_Lon{1:length(cel_Member_Lon)})]; 
% full_member_Lat_Lon=[str2num(var_Member_Lat_Lon)];                              %会员位置(GPS)纬度lat,经度lon
% [token, remain] = strtok(filename,'.');
% savefilename1=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename1,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID');
% %savefilename2=strcat(strcat(pathWriteExcel,token),'整理.xlsx');
% %xlswrite(savefilename2, recSD );
%%
% filename='m3.xlsx';%会员信息数据文件名
% xlRange = 'A:C';
% [dataMission, celMission, ~] = xlsread(strcat(pathRead,filename),xlRange);  %读取pathRead\filename,sheet1
% new_Mission_Lat_Lon=[dataMission(:,1),dataMission(:,2)];                        %新任务gps纬度lat,经度lon
% cel1=celMission(:,1);                                   
% new_Mission_ID=char(cel1{1:length(cel1)});                                      %新任务号码
% [token, remain] = strtok(filename,'.');
% savefilename1=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename1,'new_Mission_Lat_Lon','new_Mission_ID');
% %savefilename2=strcat(strcat(pathWriteExcel,token),'整理.xlsx');
% %xlswrite(savefilename2, recSD );
%%
%清除无效会员
token1='m2';%会员信息数据文件名
loadfilename1=strcat(strcat(pathWriteMat,token1),'.mat');
load(loadfilename1,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID');
token2='m1';%已结束项目任务数据文件名
loadfilename2=strcat(strcat(pathWriteMat,token2),'.mat');
load(loadfilename2,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%任务分配方案
ratio_Mission_Distribution=full_member_Mission_Limit./sum(full_member_Mission_Limit);%按分配限额计算分配所占比例
total_Mission_Count=length(compl_Mission_ID);
value_Mission_Distribution=fix(total_Mission_Count.*ratio_Mission_Distribution);%按所占比例分配实际可选任务数
for id_member=1:length(value_Mission_Distribution) %确保最少可选一个任务
    if value_Mission_Distribution(id_member)<0.5
        value_Mission_Distribution(id_member)=1;
    end
end
full_member_IDnum=str2num(full_member_ID(:,2:length(full_member_ID(1,:))));%会员编号改为数字序列
mission_Distribution1=[full_member_IDnum,full_member_Lat_Lon,value_Mission_Distribution,full_member_Mission_Begin_Time,full_member_Credit];
mission_Distribution=sortrows(mission_Distribution1,[5 -4 -6]);%按选择时间升序、选择数降序、信誉值降序排序
for id=10:length(mission_Distribution(:,1))     %按顺序选择任务直到任务分配完成
    result_Mission_Distribution=mission_Distribution(1:id,:);
    if sum(result_Mission_Distribution(:,4))>total_Mission_Count
        break
    end
end
member_ID=result_Mission_Distribution(:,1);
member_Lat_Lon=[result_Mission_Distribution(:,2),result_Mission_Distribution(:,3)];
member_Mission_Limit=result_Mission_Distribution(:,4);
member_Mission_Begin_Time=result_Mission_Distribution(:,5);
member_Credit=result_Mission_Distribution(:,6);
savefilename=strcat(strcat(pathWriteMat,token1),'.mat');
save(savefilename,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID','member_Lat_Lon','member_Mission_Limit','member_Mission_Begin_Time','member_Credit','member_ID');
%log_valid_Credit=full_member_Credit>10 & full_member_Credit<2000;                %清除信誉值小于10，大于2000会员
% figure
% scatter(full_member_Credit,full_member_Mission_Limit,[],full_member_Mission_Begin_Time)