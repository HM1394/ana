%ͳ�Ʒ�ÿ�������dis_limit���ﷶΧ��������stat_distance_limit_Mission_Count����ӳ�����ܼ��ȣ�����¼��stat_distance_limit_Mission�����ļ��ڡ�
function [stat_distance_limit_Mission_Count,stat_distance_limit_Mission_price_Mean,...
    stat_distance_limit_Mission_price_Sum,stat_distance_limit_Mission_price_Std,...
    stat_distance_limit_Mission_Distance_Mean,stat_distance_limit_Mission_Distance_Sum,stat_distance_limit_Mission_Distance_Std]=stDistance_MisDensity(dis_limit)
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%�ѽ�����Ŀ���������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
log_dis_limit_Mission=(mission_Distance-dis_limit)<0&mission_Distance~=0;
mid_Mission_price=compl_Mission_price';
for id=1:length(log_dis_limit_Mission(:,1))    
    mid_Mission_Distance=mission_Distance(id,:);
    valid_Mission_Distance=mid_Mission_Distance(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_Count(id,1)=length(valid_Mission_Distance);
    stat_distance_limit_Mission_Distance_Mean(id,1)=median(valid_Mission_Distance);
    stat_distance_limit_Mission_Distance_Sum(id,1)=sum(valid_Mission_Distance);
    stat_distance_limit_Mission_Distance_Std(id,1)=iqr(valid_Mission_Distance);
    valid_Mission_price=mid_Mission_price(log_dis_limit_Mission(id,:));
    stat_distance_limit_Mission_price_Mean(id,1)=median(valid_Mission_price);
    stat_distance_limit_Mission_price_Sum(id,1)=sum(valid_Mission_price);
    stat_distance_limit_Mission_price_Std(id,1)=iqr(valid_Mission_price);    
end
% token='stDistance_MisDensity';                                     %��¼ÿ�������ȷ������뾶��Χ�������ܼ����ļ�
% savefilename=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename,'stat_distance_limit_Mission_Count','stat_distance_limit_Mission_price_Mean',...
%     'stat_distance_limit_Mission_price_Sum','stat_distance_limit_Mission_price_Std','stat_distance_limit_Mission_Distance_Mean');