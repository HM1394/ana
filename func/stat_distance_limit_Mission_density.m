%ͳ�Ʒ�ÿ�������dis_limit���ﷶΧ��������stat_distance_limit_Mission_Count����ӳ�����ܼ��ȣ�����¼��stat_distance_limit_Mission�����ļ��ڡ�
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%�ѽ�����Ŀ���������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
dis_limit1=3;          %��һ��Ч����
log_dis_limit_Mission=(mission_Distance-dis_limit1)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    %ȡ��Ч�����ڵ���Ч����ľ��뼯�ϣ�������
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,1)=length(valid_Mission_Distance)-1;
end
dis_limit2=15;          %�ڶ���Ч����
log_dis_limit_Mission=(mission_Distance-dis_limit2)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,2)=length(valid_Mission_Distance);    
end
dis_limit3=30;          %������Ч����
log_dis_limit_Mission=(mission_Distance-dis_limit3)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,3)=length(valid_Mission_Distance);    
end
token='stat_distance_limit_Mission_density';                                     %��¼ÿ�������ȷ������뾶��Χ�������ܼ����ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_distance_limit_Mission_Count');