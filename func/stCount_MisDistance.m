%ͳ�Ʒ���ÿ�������Ϊ�������count_limit�������������������ݼ��ϣ�����stat_Mission_Count��ƽ���۸�stat_Misssion_Mean,�ܼ۸�stat_Mission_Sum��
%����count_limit3�޶����Ч������������������������count_limit_Mission_Distance������¼��stat_Mission�����ļ���
function stCount_MisDistance(count_limit)
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='distance_value';%������������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'mission_Distance');
token='m1';%�ѽ�����Ŀ���������ļ���
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
mid_Valid_Mission3=sort(mission_Distance,2);
valid_Mission3=mid_Valid_Mission3(:,2:count_limit+1);
stat_count_limit_Mission_Distance_Mean3=median(valid_Mission3,2);
stat_count_limit_Mission_Distance_Sum3=sum(valid_Mission3,2);
stat_count_limit_Mission_Distance_Std3=std(valid_Mission3,1,2);
%���ͳ�Ʋ���������(row)������˳���а���Ч������˳����Ϊɢ�е�ͼ�������
stat_count_limit_Mission_Distance_Mean=[stat_count_limit_Mission_Distance_Mean1,stat_count_limit_Mission_Distance_Mean2,stat_count_limit_Mission_Distance_Mean3];
stat_count_limit_Mission_Distance_Sum=[stat_count_limitd_Mission_Distance_Sum1,stat_count_limit_Mission_Distance_Sum2,stat_count_limit_Mission_Distance_Sum3];
stat_count_limit_Mission_Distance_Std=[stat_count_limit_Mission_Distance_Std1,stat_count_limit_Mission_Distance_Std2,stat_count_limit_Mission_Distance_Std3];
%ȡ������Ч����������������ݾ���valid_Mission3������count_limit_Mission_Distance����Ϊ����ģ���������
count_limit_Mission_Distance=valid_Mission3;
token='stCount_MisDistance';                                     %��¼����㷶Χ��һ����������ľ���ͳ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'count_limit_Mission_Distance','stat_count_limit_Mission_Distance_Mean','stat_count_limit_Mission_Distance_Sum','stat_count_limit_Mission_Distance_Std');


