%%
%����excel��ʽ����Ŀ���ϣ������ѽ�����Ŀ��������д��m1.mat,��Ա��Ϣ����д��m2.mat,����Ŀ��������д��m3.mat,ԭ�ļ�ȡ��������
clear all
pathRead='E:\ana\excel\';%����excel��ʽ����Ŀ���ϴ洢·��
pathWriteExcel='E:\ana\excel\';%дexcel�ĵ�·��
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
%%
%filename='m1.xlsx';%�ѽ�����Ŀ���������ļ���
%xlRange = 'A:E';
%[dataMission, celMission, ~] = xlsread(strcat(pathRead,filename),xlRange); %��ȡpathRead\filename,sheet1
%compl_Mission_lat_lon=[dataMission(:,1),dataMission(:,2)];                 %�ѽ�������gpsγ��lat,����lon
%compl_Mission_price=dataMission(:,3);                                      %�ѽ���������price
%compl_Mission=dataMission(:,4);                                            %�ѽ�������ִ�����complete
%cel1=celMission(:,1);                                   
%compl_Mission_ID=char(cel1{1:length(cel1)});                               %�ѽ�������������
%[token, remain] = strtok(filename,'.');
%savefilename1=strcat(strcat(pathWriteMat,token),'.mat');
%save(savefilename1,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%savefilename2=strcat(strcat(pathWriteExcel,token),'����.xlsx');
%%xlswrite(savefilename2, recSD );
%%
filename='m2.xlsx';%��Ա��Ϣ�����ļ���
xlRange = 'A:E';
[dataMember, celMember, ~] = xlsread(strcat(pathRead,filename),xlRange);   %��ȡpathRead\filename,sheet1
full_member_Mission_Limit=dataMember(:,1);                                      %��ԱԤ�������޶�
full_member_Mission_Begin_Time=dataMember(:,2);                                 %Ԥ������ʼʱ��
full_member_Credit=dataMember(:,3);                                             %��Ա����ֵ
cel1=celMember(:,1);                                   
full_member_ID=char(cel1{1:length(cel1)});                                      %��Ա���
cel2=celMember(:,2);
[cel_Member_Lat, cel_Member_Lon] = strtok(cel2,' ');
var_Member_Lat_Lon=[char(cel_Member_Lat{1:length(cel_Member_Lat)}),char(cel_Member_Lon{1:length(cel_Member_Lon)})]; 
full_member_Lat_Lon=[str2num(var_Member_Lat_Lon)];                              %��Աλ��(GPS)γ��lat,����lon
log_valid_Credit=full_member_Credit>10 & full_member_Credit<2000;                %�������ֵС��10������2000��Ա
member_Mission_Limit=full_member_Mission_Limit(log_valid_Credit);
member_Mission_Begin_Time=full_member_Mission_Begin_Time(log_valid_Credit);
member_Credit=full_member_Credit(log_valid_Credit);
member_ID=full_member_ID(log_valid_Credit,:);
member_Lat_Lon=full_member_Lat_Lon(log_valid_Credit,:);
[token, remain] = strtok(filename,'.');
savefilename1=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename1,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID','member_Lat_Lon','member_Mission_Limit','member_Mission_Begin_Time','member_Credit','member_ID');
%savefilename2=strcat(strcat(pathWriteExcel,token),'����.xlsx');
%xlswrite(savefilename2, recSD );
%%
% filename='m3.xlsx';%��Ա��Ϣ�����ļ���
% xlRange = 'A:C';
% [dataMission, celMission, ~] = xlsread(strcat(pathRead,filename),xlRange);  %��ȡpathRead\filename,sheet1
% new_Mission_Lat_Lon=[dataMission(:,1),dataMission(:,2)];                        %������gpsγ��lat,����lon
% cel1=celMission(:,1);                                   
% new_Mission_ID=char(cel1{1:length(cel1)});                                      %���������
% [token, remain] = strtok(filename,'.');
% savefilename1=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename1,'new_Mission_Lat_Lon','new_Mission_ID');
% %savefilename2=strcat(strcat(pathWriteExcel,token),'����.xlsx');
% %xlswrite(savefilename2, recSD );


