%���������Ŀ����˳�򡢻�Աԭʼ˳�������������������(row)Ϊ����������(cul��Ϊ������Ա
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='m1';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Lat_Lon','member_Mission_Limit','member_Mission_Begin_Time','member_Credit','member_ID');
%load(loadfilename,'new_Mission_Lat_Lon','new_Mission_ID');
for id=1:length(compl_Mission_lat_lon(:,1))                 %����ÿ�����������
    mission_Distance(:,id)=deg2km(distance(compl_Mission_lat_lon(id,1),compl_Mission_lat_lon(id,2),compl_Mission_lat_lon(:,1),compl_Mission_lat_lon(:,2)));    
end
for id=1:length(member_Lat_Lon(:,1))                 %����ÿ����������Ա�ľ���
    mission_Member_Distance(:,id)=deg2km(distance(member_Lat_Lon(id,1),member_Lat_Lon(id,2),compl_Mission_lat_lon(:,1),compl_Mission_lat_lon(:,2)));    
end
token='distance_value';                                     %��¼��������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'mission_Distance','mission_Member_Distance');

