%���������ı���۸�,��Χ�����ܼ۸������ܼ��ȣ���Ա�ܼ��ȣ���Ա��������������������ϵ
% clear all
% pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
% %%
% token='m1';%�ѽ�����Ŀ���������ļ�
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'compl_Mission_price','compl_Mission','compl_Mission_ID');
% %%
% %����ÿ������������count_limit����Ա��ƽ���������stat_count_limit_Member_Distance_Mean��ȡ�����ֵ��Ϊÿ����������İ뾶�޶�dis_limit
% count_limit=4;
% stCount_MemDistance(count_limit);
% token='stCount_MemDistance';                                     %��¼���������������һ����������Ч��Ա��ͳ�������ļ�
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'count_limit_Member_Distance','count_limit_Member_Credit','stat_count_limit_Member_Credit_Median',...
%     'stat_count_limit_Member_Credit_Sum','stat_count_limit_Member_Credit_Std','stat_count_limit_Member_Distance_Mean',...
%     'stat_count_limit_Member_Distance_Sum','stat_count_limit_Member_Distance_Std');
% dis_limit=ceil(mean(stat_count_limit_Member_Distance_Mean)+std(stat_count_limit_Member_Distance_Mean));
% %%
% %����ÿ�������Ϊ���ģ�dis_limit����Ϊ�뾶��Բ�ܷ�Χ�ڻ�Ա����������Ա������������
% stDistance_MemDensity(dis_limit);
% token='stDistance_MembDensity';                                     %��¼�������һ���뾶��Χ�ڻ�Ա�ܼ��ȡ�������ͳ�������ļ�
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'stat_distance_limit_Member_Count','stat_distance_limit_Member_Credit_Mean',...
%     'stat_distance_limit_Member_Credit_Sum','stat_distance_limit_Member_Credit_Std',...
%     'stat_distance_limit_Member_Mission_Sum','stat_distance_limit_Member_Distance_Mean');
% %%
% %����ÿ�������Ϊ���ģ�dis_limit����Ϊ�뾶��Բ�ܷ�Χ�����������������ܼ۸�
% stDistance_MisDensity(dis_limit)
% token='stDistance_MisDensity';                                     %��¼�������һ���뾶��Χ�������ܼ��������ļ�
% loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
% load(loadfilename,'stat_distance_limit_Mission_Count','stat_distance_limit_Mission_price_Mean',...
%     'stat_distance_limit_Mission_price_Sum','stat_distance_limit_Mission_price_Std','stat_distance_limit_Mission_Distance_Mean');
% %%
% %����۸񡢻�Ա�ܼ��ȡ���Ա������ֵ�������ܼ��ȡ������ܼ۸�����ݱ�׼��
% stand_compl_Mission_price=compl_Mission_price./std(compl_Mission_price);
% stand_distance_limit_Member_Count=stat_distance_limit_Member_Count./std(stat_distance_limit_Member_Count);
% stand_distance_limit_Member_Credit_Sum=stat_distance_limit_Member_Credit_Sum/std(stat_distance_limit_Member_Credit_Sum);
% stand_distance_limit_Member_Distance_Mean=stat_distance_limit_Member_Distance_Mean./...
%     std(stat_distance_limit_Member_Distance_Mean(~isnan(stat_distance_limit_Member_Distance_Mean)));
% stand_distance_limit_Member_Mission_Sum=stat_distance_limit_Member_Mission_Sum./std(stat_distance_limit_Member_Mission_Sum);
% stand_distance_limit_Mission_Count=stat_distance_limit_Mission_Count./std(stat_distance_limit_Mission_Count);
% stand_distance_limit_Mission_price_Sum=stat_distance_limit_Mission_price_Sum/std(stat_distance_limit_Mission_price_Sum);
% stand_distance_limit_Mission_Distance_Mean=stat_distance_limit_Mission_Distance_Mean./...
%     std(stat_distance_limit_Mission_Distance_Mean(~isnan(stat_distance_limit_Mission_Distance_Mean)));
% %���������������
% ansys_Data=[compl_Mission,stand_compl_Mission_price,...
%     stand_distance_limit_Member_Count,stand_distance_limit_Member_Credit_Sum,...
%     stand_distance_limit_Member_Distance_Mean,stand_distance_limit_Member_Mission_Sum,...
%     stand_distance_limit_Mission_Count,stand_distance_limit_Mission_price_Sum,...
%     stand_distance_limit_Mission_Distance_Mean];
%%
%����ָ���뾶����Ч����������Ч��Ա���Ķ�άɢ��ͼ��������۸���顣����۸�65-74.5���䰴0.5Ԫ������75-85���䰴5Ԫ������ccggggbbbbyyyymmmmmmwww
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','�۸����ͼ');
%gscatter(ansys_Data(:,8),ansys_Data(:,5),ansys_Data(:,2),'cgbyr','*o<+.',5)
%gplotmatrix(ansys_Data(:,6:8),ansys_Data(:,3:5),ansys_Data(:,1),'cgwww','o',5)
scatter3(ansys_Data(:,6),ansys_Data(:,7),ansys_Data(:,9),6,ansys_Data(:,1),'full','o')




%% 
% %����ָ���뾶����Ч����������Ч��Ա��������۸����άɢ��ͼ���Ժ�ɫ*��ʾδ��ɣ���ɫO��ʾ��ɡ�
% ansys_Data1=[compl_Mission,compl_Mission_price,stat_Mission_Count,stat_Member_Count];
% figure;
% gscatter(ansys_Data1(:,7),ansys_Data1(:,5),ansys_Data1(:,1),'rb','xo');
%%
% %���㰴5km�뾶����Ч������ͳ����Ӧ��ƽ���۸񡢼۸��׼���������������������Ա����ֵ��ֵ���ϻ�Ա�����ı�׼�����result_Data2����
% ansys_Data2=[compl_Mission,compl_Mission_price,stat_Mission_Count(:,2),stat_Member_Mean(:,2)+stat_Member_Std(:,2)];
% for ii=1:max(ansys_Data2(:,3))
%     log_cul_Data2=(ansys_Data2(:,3)>ii-1) & (ansys_Data2(:,3)<=ii);
%     cul_Data2=ansys_Data2(log_cul_Data2,:);
%     result_Data2(ii,1)=ii;
%     result_Data2(ii,2)=mean(cul_Data2(:,2));
%     result_Data2(ii,3)=std(cul_Data2(:,2));
%     result_Data2(ii,4)=length(cul_Data2(:,3));
%     result_Data2(ii,5)=mean(cul_Data2(:,4));
% end
%%
% ansys_Data3=[compl_Mission,compl_Mission_price,stat_Mission_Count(:,2),stat_Member_count(:,2)];
% for ii=2:max(ansys_Data3(:,3))
%     log_cul_Data3=(ansys_Data3(:,3)>ii-1.1) & (ansys_Data3(:,3)<ii);
%     cul_Data3=ansys_Data3(log_cul_Data3,:);
%     X=cul_Data3(:,2);
%     %probplot('exponential',cul_Data3(:,2));figure(gcf)   
%     gscatter(ansys_Data1(:,7),ansys_Data1(:,5),ansys_Data1(:,1),'rb','xo')
% end

