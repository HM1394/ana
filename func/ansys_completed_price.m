%�����������ļ۸�compl_Mission_price,����������compl_Mission����dis_limit2���ﷶΧ��������stat_Mission_Count��ƽ���۸�stat_Misssion_Mean,�ܼ۸�stat_Mission_Sum,����¼��stat_Mission�����ļ���
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token='stat_Member';%��¼�����һ����Χ�ڻ�Ա����ͳ�������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'stat_Member_Count','stat_Member_Mean','stat_Member_Sum','stat_Member_Std');
token='stat_Mission';                                      %��¼�����һ����Χ�������ֵͳ�������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'stat_Mission_Count','stat_Mission_Mean','stat_Mission_Sum','stat_Mission_Std');
token='m1';%�ѽ�����Ŀ���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_price','compl_Mission','compl_Mission_ID');
token='stat_Member_Distance';%��������ܱ���Ч��Ա��ƽ������������ͳ�������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'stat_valid_Member_Credit','stat_valid_Member_Distance_Mean','stat_valid_Member_Distance_Sum','stat_valid_Member_Distance_Std');
%%
%����ָ���뾶����Ч����������Ч��Ա���Ķ�άɢ��ͼ��������۸���顣����۸�65-74.5���䰴0.5Ԫ������75-85���䰴5Ԫ������ccggggbbbbyyyymmmmmmwww
ansys_Data=[compl_Mission,compl_Mission_price,stat_Mission_Count,stat_valid_Member_Credit];
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','�۸����ͼ','Colormap',[0 0 0;0 0 1;0.0246710535138845 0.0246710535138845 1;0.0493421070277691 0.0493421070277691 1;0.0740131586790085 0.0740131586790085 1;0.0986842140555382 0.0986842140555382 1;0.123355261981487 0.123355261981487 1;0.148026317358017 0.148026317358017 1;0.172697365283966 0.172697365283966 1;0.197368428111076 0.197368428111076 1;0.222039476037025 0.222039476037025 1;0.246710523962975 0.246710523962975 1;0.271381586790085 0.271381586790085 1;0.296052634716034 0.296052634716034 1;0.320723682641983 0.320723682641983 1;0.345394730567932 0.345394730567932 1;0.370065778493881 0.370065778493881 1;0.394736856222153 0.394736856222153 1;0.419407904148102 0.419407904148102 1;0.444078952074051 0.444078952074051 1;0.46875 0.46875 1;0.493421047925949 0.493421047925949 1;0.518092095851898 0.518092095851898 1;0.54276317358017 0.54276317358017 1;0.567434191703796 0.567434191703796 1;0.592105269432068 0.592105269432068 1;0.616776287555695 0.616776287555695 1;0.641447365283966 0.641447365283966 1;0.666118443012238 0.666118443012238 1;0.690789461135864 0.690789461135864 1;0.715460538864136 0.715460538864136 1;0.740131556987762 0.740131556987762 1;0.764802634716034 0.764802634716034 1;0.789473712444305 0.789473712444305 1;0.814144730567932 0.814144730567932 1;0.838815808296204 0.838815808296204 1;0.86348682641983 0.86348682641983 1;0.888157904148102 0.888157904148102 1;0.912828922271729 0.912828922271729 1;0.9375 0.9375 1;0.953125 0.953125 1;0.96875 0.96875 1;0.984375 0.984375 1;1 1 1;1 1 0.954023003578186;1 1 0.908045947551727;1 1 0.862068951129913;1 1 0.808189630508423;1 1 0.754310309886932;1 1 0.700431048870087;1 1 0.646551728248596;1 1 0.592672407627106;1 1 0.538793087005615;1 1 0.484913796186447;1 1 0.431034475564957;1 1 0.377155154943466;1 1 0.323275864124298;1 1 0.269396543502808;1 1 0.215517237782478;1 1 0.161637932062149;1 1 0.107758618891239;1 1 0.0538793094456196;1 1 0;1 0 0]);
% h = gcf;
% set(h,'Color',[1 1 1]);
% h1=gca;
% set(h1,'ColorOrder',[0.8,0.8,1;0.8,0.8,1;0.6,0.6,1;0.6,0.6,1;0.4,0.4,1;0.4,0.4,1;0.2,0.2,1;0,0,1;0,0,1;0,0,0.8;0,0,0.8;0,0,0.6;0,0,0.6;0,0,0.4;0,0,0.4;0,0,0.2;0,0,0.2;1,0.8,0.8;1,0.8,0.8;1,0.6,0.6;1,0.6,0.6;1,0.4,0.4;1,0.2,0.2;1,0,0]);
% gscatter(ansys_Data1(:,7),ansys_Data1(:,5),ansys_Data1(:,1),'rb','xo')
gplotmatrix(ansys_Data(:,6:8),ansys_Data(:,3:5),ansys_Data(:,2),'ccggggbbbbyyyymmmmmmrrr','*o<',3)





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

