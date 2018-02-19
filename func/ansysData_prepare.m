%���������ı���۸�,��Χ�����ܼ۸������ܼ��ȣ���Ա�ܼ��ȣ���Ա��������������������ϵ
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
%%
token='m1';%�ѽ�����Ŀ���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
%����ÿ������������memCount_limit����Ա�ľ��롢����ֵ��ƽ��ֵanyCount_MemDistance_Mean��anyCount_MemCredit_Mean
%�ͱ�׼��anyCount_MemDistance_Std��anyCount_MemCredit_Std,������anyCount_MemData�ļ�
memCount_limit=[5,22,60];          %ѡ��5�ˣ�22�ˣ�60��ͳ��
anyCount_Member_DisMean=[];
anyCount_Member_DisStd=[];
anyCount_Member_CreMean=[];
anyCount_Member_CreStd=[];
for countID=1:length(memCount_limit);
    [count_limit_Member_Distance,count_limit_Member_Credit,...
          stat_count_limit_Member_Credit_Median,stat_count_limit_Member_Credit_Sum,...
          stat_count_limit_Member_Credit_Std,stat_count_limit_Member_Distance_Mean,...
          stat_count_limit_Member_Distance_Sum,stat_count_limit_Member_Distance_Std,...
          stat_count_limit_Member_Mission_Median,stat_count_limit_Member_Mission_Sum,...
          stat_count_limit_Member_Mission_Std]=stCount_MemDistance(memCount_limit(countID));
    anyCount_Member_DisMean(:,countID)=stat_count_limit_Member_Distance_Mean; 
    anyCount_Member_DisStd(:,countID)=stat_count_limit_Member_Distance_Std;
    anyCount_Member_CreMean(:,countID)=stat_count_limit_Member_Credit_Median;
    anyCount_Member_CreStd(:,countID)=stat_count_limit_Member_Credit_Std;
    anyCount_Member_MisSum(:,countID)=stat_count_limit_Member_Mission_Sum;
end
token='anyCount_MemData';                                     %���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
save(loadfilename,'anyCount_Member_MisSum','anyCount_Member_DisMean','anyCount_Member_DisStd','anyCount_Member_CreMean','anyCount_Member_CreStd');
%%
%����ÿ������������misCount_limit������ľ��롢�۸��ƽ��ֵanyCount_Mission_DisMean��anyCount_Mission_PriMean
%�ͱ�׼��anyCount_Mission_DisStd��anyCount_Mission_PriStd,������anyCount_MisData�ļ�
misCount_limit=[2,5,10];        %ѡ��2������5������10������
anyCount_Mission_DisMean=[];
anyCount_Mission_DisStd=[];
anyCount_Mission_PriMean=[];
anyCount_Mission_PriStd=[];
for countID=1:length(misCount_limit);
     [count_limit_Mission_Distance,         count_limit_Mission_Price,              stat_count_limit_Mission_Distance_Mean,...
        stat_count_limit_Mission_Distance_Sum,  stat_count_limit_Mission_Distance_Std,  stat_count_limit_Mission_Price_Mean,...
        stat_count_limit_Mission_Price_Sum,     stat_count_limit_Mission_Price_Std]=stCount_MisDistance(misCount_limit(countID));
    anyCount_Mission_DisMean(:,countID)=stat_count_limit_Mission_Distance_Mean; 
    anyCount_Mission_DisStd(:,countID)=stat_count_limit_Mission_Distance_Std;
    anyCount_Mission_PriMean(:,countID)=stat_count_limit_Mission_Price_Mean;
    anyCount_Mission_PriStd(:,countID)=stat_count_limit_Mission_Price_Std;
end
token='anyCount_MisData';                                     %���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
save(loadfilename,'anyCount_Mission_DisMean','anyCount_Mission_DisStd','anyCount_Mission_PriMean','anyCount_Mission_PriStd');
%%
%����ÿ�������Ϊ���ģ�misDis_limit����Ϊ�뾶��Բ�ܷ�Χ�ڻ�Ա����������Ա�������Ⱦ�ֵ����׼���Ա����������ľ���ľ�ֵ����׼���ԱԤ�����������;
%��������������������������ľ�ֵ����׼�����۸�ľ�ֵ����׼�
misDis_limit=[2,5,50]; %ѡ��2���5���50����
anyDis_Member_Count=[];
anyDis_Member_DisMean=[];
anyDis_Member_DisSum=[];
anyDis_Member_DisStd=[];
anyDis_Member_CreMean=[];
anyDis_Member_CreSum=[];
anyDis_Member_CreStd=[];
anyDis_Member_MisSum=[];
anyDis_Mission_Count=[];
anyDis_Mission_DisMean=[];
anyDis_Mission_DisSum=[];
anyDis_Mission_DisStd=[];
anyDis_Mission_PriMean=[];
anyDis_Mission_PriSum=[];
anyDis_Mission_PriStd=[];

for distanceID=1:length(misDis_limit);
  [stat_distance_limit_Member_Count,stat_distance_limit_Member_Credit_Mean,...
    stat_distance_limit_Member_Credit_Sum,stat_distance_limit_Member_Credit_Std,...
    stat_distance_limit_Member_Mission_Sum,stat_distance_limit_Member_Distance_Mean,...
    stat_distance_limit_Member_Distance_Sum,stat_distance_limit_Member_Distance_Std]=stDistance_MemDensity(misDis_limit(distanceID));
    
  [stat_distance_limit_Mission_Count,stat_distance_limit_Mission_price_Mean,...
    stat_distance_limit_Mission_price_Sum,stat_distance_limit_Mission_price_Std,...
    stat_distance_limit_Mission_Distance_Mean,stat_distance_limit_Mission_Distance_Sum,stat_distance_limit_Mission_Distance_Std]=stDistance_MisDensity(misDis_limit(distanceID));
    
    anyDis_Member_Count(:,distanceID)=stat_distance_limit_Member_Count;
    anyDis_Member_DisMean(:,distanceID)=stat_distance_limit_Member_Distance_Mean;
    anyDis_Member_DisSum(:,distanceID)=stat_distance_limit_Member_Distance_Sum;
    anyDis_Member_DisStd(:,distanceID)=stat_distance_limit_Member_Distance_Std;
    anyDis_Member_CreMean(:,distanceID)=stat_distance_limit_Member_Credit_Mean;
    anyDis_Member_CreSum(:,distanceID)=stat_distance_limit_Member_Credit_Sum;
    anyDis_Member_CreStd(:,distanceID)=stat_distance_limit_Member_Credit_Std;
    anyDis_Member_MisSum(:,distanceID)=stat_distance_limit_Member_Mission_Sum;
    anyDis_Mission_Count(:,distanceID)=stat_distance_limit_Mission_Count;
    anyDis_Mission_DisMean(:,distanceID)=stat_distance_limit_Mission_Distance_Mean;
    anyDis_Mission_DisSum(:,distanceID)=stat_distance_limit_Mission_Distance_Sum;
    anyDis_Mission_DisStd(:,distanceID)=stat_distance_limit_Mission_Distance_Std;
    anyDis_Mission_PriMean(:,distanceID)=stat_distance_limit_Mission_price_Mean;
    anyDis_Mission_PriSum(:,distanceID)=stat_distance_limit_Mission_price_Sum;
    anyDis_Mission_PriStd(:,distanceID)=stat_distance_limit_Mission_price_Std;
end
token='anyDis_MemData';                                     %���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
save(loadfilename,'anyDis_Member_Count','anyDis_Member_DisMean','anyDis_Member_DisSum',...
    'anyDis_Member_DisStd','anyDis_Member_CreMean','anyDis_Member_CreSum',...
    'anyDis_Member_CreStd','anyDis_Member_MisSum',...
    'anyDis_Mission_Count','anyDis_Mission_DisMean','anyDis_Mission_DisSum',...
    'anyDis_Mission_DisStd','anyDis_Mission_PriMean','anyDis_Mission_PriSum',...
    'anyDis_Mission_PriStd');


