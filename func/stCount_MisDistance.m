%ͳ�Ʒ���ÿ�������Ϊ�������count_limit�������������������ݼ��ϣ�����stat_Mission_Count��ƽ���۸�stat_Misssion_Mean,�ܼ۸�stat_Mission_Sum��
%����count_limit3�޶����Ч������������������������count_limit_Mission_Distance������¼��stat_Mission�����ļ���
function [count_limit_Mission_Distance,         count_limit_Mission_Price,              stat_count_limit_Mission_Distance_Mean,...
        stat_count_limit_Mission_Distance_Sum,  stat_count_limit_Mission_Distance_Std,  stat_count_limit_Mission_Price_Mean,...
        stat_count_limit_Mission_Price_Sum,     stat_count_limit_Mission_Price_Std]=stCount_MisDistance(count_limit)
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%�ѽ�����Ŀ���������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
mid_Mission_Price=compl_Mission_price';
for id=1:length(mission_Distance(:,1))
    mid_Valid_Mission=[mission_Distance(id,:);mid_Mission_Price]';
    s1=sortrows(mid_Valid_Mission,1);
    s=s1';
    valid_Mission=s(:,2:count_limit+1);
    stat_count_limit_Mission_Price_Mean(id,1)=median(valid_Mission(2,:));
    stat_count_limit_Mission_Price_Sum(id,1)=sum(valid_Mission(2,:));
    stat_count_limit_Mission_Price_Std(id,1)=iqr(valid_Mission(2,:));
    stat_count_limit_Mission_Distance_Mean(id,1)=median(valid_Mission(1,:));
    stat_count_limit_Mission_Distance_Sum(id,1)=sum(valid_Mission(1,:));
    stat_count_limit_Mission_Distance_Std(id,1)=iqr(valid_Mission(1,:));
    count_limit_Mission_Distance(id,:)=valid_Mission(1,:);%ȡ��Ч��Ա���޶�Ļ�Ա��������ľ���ֵ����������count_limit_Mission_Distance����Ϊ����ģ���������
    count_limit_Mission_Price(id,:)=valid_Mission(2,:);%ȡ��Ч��Ա���޶�Ļ�Ա�������������ֵ����������count_limit_Mission_Price����Ϊ����ģ���������
end
% token='stCount_MisDistance';                                     %��¼����㷶Χ��һ����������ľ���ͳ�������ļ�
% savefilename=strcat(strcat(pathWriteMat,token),'.mat');
% save(savefilename,'count_limit_Mission_Distance',         'count_limit_Mission_Price',              'stat_count_limit_Mission_Distance_Mean',...
%         'stat_count_limit_Mission_Distance_Sum',  'stat_count_limit_Mission_Distance_Std',  'stat_count_limit_Mission_Price_Mean',...
%         'stat_count_limit_Mission_Price_Sum',     'stat_count_limit_Mission_Price_Std');


