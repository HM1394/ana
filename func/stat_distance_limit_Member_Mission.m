%ͳ�Ʒ���ÿ�������dis_limit����뾶��Χ�ڻ�Ա������stat_distance_limit_Member_Count,��Ч������stat_distance_limit_Mission_Count,Ԥ��������������Ч������֮�ȡ�
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
%%
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Member_Distance','mission_Distance');
%%
token='m2';%��Ա��Ϣ�����ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Mission_Limit','member_Mission_Begin_Time','member_Credit');
%%
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
%%
token='m1';%�ѽ�����Ŀ���������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
mid_Member_Mission_Limit=member_Mission_Limit';
mid_Member_Credit=member_Credit';
dis_limit=50;          %��Ч����
log_dis_limit_Member=(mission_Member_Distance-dis_limit)<0&mission_Member_Distance~=0;
for id=1:length(log_dis_limit_Member(:,1))
   %ȡ��Ч�����ڵ���Ч��Ա�ľ��뼯�ϣ�������
    valid_Member_Mission_Limit=mid_Member_Mission_Limit(log_dis_limit_Member(id,:));
    valid_Member_Credit=mid_Member_Credit(log_dis_limit_Member(id,:));
    stat_distance_limit_Member_Credit_Sum(id,1)=sum(valid_Member_Credit);
    stat_distance_limit_Member_Count(id,1)=length(valid_Member_Mission_Limit);
    stat_distance_limit_Member_Mission_Sum(id,1)=sum(valid_Member_Mission_Limit);   
end
log_dis_limit_Mission=(mission_Distance-dis_limit)<0&mission_Distance~=0;
for id=1:length(log_dis_limit_Mission(:,1))
    %ȡ��Ч�����ڵ���Ч����ľ��뼯�ϣ�������
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,1)=length(valid_Mission_Distance);
    stat_distance_limit_Mission_Distance_Mean(id,1)=mean(valid_Mission_Distance);
end
token='stat_distance_limit_Member_Mission';                                     %��¼�����һ���뾶��Χ�ڻ�Ա�ܼ��ȡ�������ͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Mission_Sum','stat_distance_limit_Mission_Count','stat_distance_limit_Mission_Distance_Mean');
ansys_price_Data=[compl_Mission,compl_Mission_price,stat_distance_limit_Member_Credit_Sum,...
    stat_distance_limit_Mission_Distance_Mean,stat_distance_limit_Member_Mission_Sum./stat_distance_limit_Mission_Count];
%���ݱ�׼����������/���ݼ��ı�׼��
x=ansys_price_Data(:,3)./std(ansys_price_Data(:,3));
y=ansys_price_Data(:,2)./std(ansys_price_Data(:,2));
z=ansys_price_Data(:,5);
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','��ʪ�Ȳ���ͳ�Ʒ�����');
subW2=subplot(2,1,2);
%set(subW2,'Position',[0.13 0.032 0.775 0.088]);
scatter3(x,y,z,6,ansys_price_Data(:,2),'full','o');
xlabel('�������ܺͱ�׼ֵ');
ylabel('ƽ�������׼ֵ');
zlabel('Ԥ��������/ʵ��������');
hold on
subW1=subplot(2,1,1);
scatter(y,ansys_price_Data(:,2));
ylabel('����۸�');
xlabel('ƽ�������׼ֵ');


