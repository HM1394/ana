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
% filename='m2.xlsx';%��Ա��Ϣ�����ļ���
% xlRange = 'A:E';
% [dataMember, celMember, ~] = xlsread(strcat(pathRead,filename),xlRange);   %��ȡpathRead\filename,sheet1
% full_member_Mission_Limit=dataMember(:,1);                                      %��ԱԤ�������޶�
% full_member_Mission_Begin_Time=dataMember(:,2);                                 %Ԥ������ʼʱ��
% full_member_Credit=dataMember(:,3);                                             %��Ա����ֵ
% cel1=celMember(:,1);                                   
% full_member_ID=char(cel1{1:length(cel1)});                                      %��Ա���
% cel2=celMember(:,2);
% [cel_Member_Lat, cel_Member_Lon] = strtok(cel2,' ');
% var_Member_Lat_Lon=[char(cel_Member_Lat{1:length(cel_Member_Lat)}),char(cel_Member_Lon{1:length(cel_Member_Lon)})]; 
% full_member_Lat_Lon=[str2num(var_Member_Lat_Lon)];                              %��Աλ��(GPS)γ��lat,����lon
% [token, remain] = strtok(filename,'.');
% savefilename1=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename1,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID');
% %savefilename2=strcat(strcat(pathWriteExcel,token),'����.xlsx');
% %xlswrite(savefilename2, recSD );
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
%%
%�����Ч��Ա
token1='m2';%��Ա��Ϣ�����ļ���
loadfilename1=strcat(strcat(pathWriteMat,token1),'.mat');
load(loadfilename1,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID');
token2='m1';%�ѽ�����Ŀ���������ļ���
loadfilename2=strcat(strcat(pathWriteMat,token2),'.mat');
load(loadfilename2,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%������䷽��
ratio_Mission_Distribution=full_member_Mission_Limit./sum(full_member_Mission_Limit);%�������޶���������ռ����
total_Mission_Count=length(compl_Mission_ID);
value_Mission_Distribution=fix(total_Mission_Count.*ratio_Mission_Distribution);%����ռ��������ʵ�ʿ�ѡ������
for id_member=1:length(value_Mission_Distribution) %ȷ�����ٿ�ѡһ������
    if value_Mission_Distribution(id_member)<0.5
        value_Mission_Distribution(id_member)=1;
    end
end
full_member_IDnum=str2num(full_member_ID(:,2:length(full_member_ID(1,:))));%��Ա��Ÿ�Ϊ��������
mission_Distribution1=[full_member_IDnum,full_member_Lat_Lon,value_Mission_Distribution,full_member_Mission_Begin_Time,full_member_Credit];
mission_Distribution=sortrows(mission_Distribution1,[5 -4 -6]);%��ѡ��ʱ������ѡ������������ֵ��������
for id=10:length(mission_Distribution(:,1))     %��˳��ѡ������ֱ������������
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
%log_valid_Credit=full_member_Credit>10 & full_member_Credit<2000;                %�������ֵС��10������2000��Ա
% figure
% scatter(full_member_Credit,full_member_Mission_Limit,[],full_member_Mission_Begin_Time)