%���������ı���۸�,��Χ�����ܼ۸������ܼ��ȣ���Ա�ܼ��ȣ���Ա��������������������ϵ
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
%%
token='m1';                                                 %��ȡ�ѽ�����Ŀ���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
%   stCompl_Mission_Price			����۸�					
% 	stCount_Member_MisSum			����Ա������������
% 	stCount_Member_DisMean			����Ա���Ļ�Աƽ������		stCount_Member_DisStd
% 	stCount_Member_CreMean      	����Ա����ƽ������ֵ 2	 stCount_Member_CreStd
% 	stCount_Mission_DisMean     	��������������ƽ������		stCount_Mission_DisStd 
% 	stCount_Mission_PriMean     	��������������ƽ���۸�		stCount_Mission_PriStd
% 	stDis_Member_Count          	������Ļ�Ա���� 3			
% 	stDis_Member_CreMean        	�������ƽ����Ա����ֵ 4	stDis_Member_CreStd
% 	stDis_Member_DisMean        	������Ļ�Աƽ������		 stDis_Member_DisStd
% 	stDis_Member_MisSum         	������Ļ�Ա��ӵ�е���������
% 	stDis_Mission_Count         	���������������
% 	stDis_Mission_PriMean       	�����������ƽ���۸�		stDis_Mission_PriStd  
% 	stDis_Mission_DisMean       	�����������ƽ������		stDis_Mission_DisStd 
% 	stKer_Mission_Distance 			����������ľ��������
% 	stMemberKer_Mission_Distance	��Ա��������������С����
% 	stKer_Member_Distance 			��Ա�����Ա���ĵľ���
token='stand_Data';                                     %��ȡ��׼���ķ����������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
load(savefilename,'stCompl_Mission_Price','stCount_Member_MisSum','stCount_Member_DisMean','stCount_Member_DisStd',...
	'stCount_Member_CreMean','stCount_Member_CreStd','stCount_Mission_DisMean','stCount_Mission_DisStd',...
	'stCount_Mission_PriMean','stCount_Mission_PriStd','stDis_Member_Count','stDis_Member_CreSum','stDis_Member_CreMean','stDis_Member_CreStd',...
	'stDis_Member_DisSum','stDis_Member_DisMean','stDis_Member_DisStd','stDis_Member_MisSum','stDis_Mission_Count',...
	'stDis_Mission_PriSum','stDis_Mission_PriMean','stDis_Mission_PriStd','stDis_Mission_DisSum','stDis_Mission_DisMean','stDis_Mission_DisStd',...
	'stKer_Mission_Distance','stMemberKer_Mission_Distance','stKer_Member_Distance');
%%
%NaN���ݴ������ڶ�����ͳ��ʱ��һ�������ڴ����޻�Ա����������ܣ��ֲ����������������Ӧ���������ر����ֻ������NaN���ֱ���
%stDis_Member_CreMean stDis_Member_CreStd stDis_Member_DisMean stDis_Member_DisStd
%stDis_Mission_DisMean stDis_Mission_DisStd stDis_Mission_PriMean stDis_Mission_PriStd
% allNaN_Member_CreMean=[compl_Mission_price,stDis_Member_CreMean];
% naN_Member_CreMean=allNaN_Member_CreMean(isnan(stDis_Member_CreMean(:,1)),:);
%%
% %��������Է���
% ansys_relativity_data=[stCompl_Mission_Price,stCount_Member_MisSum,stCount_Member_DisMean,stCount_Member_DisStd,...
% 	stCount_Member_CreMean,stCount_Member_CreStd,stCount_Mission_DisMean,stCount_Mission_DisStd,...
% 	stDis_Member_Count,stDis_Member_MisSum,stDis_Mission_Count,stKer_Mission_Distance,stMemberKer_Mission_Distance];
% result_relat=corrcoef(ansys_relativity_data);
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','���������ͼ','Colormap',cool);
% gplotmatrix(result_relat(:,1:5),(1:33)',[],'rgbymc','o*+^<>',2);%����Ҫ���ط����������ɢ�����ͼ�۲�����ضԼ۸��Ӱ��
%%
% ���ضԼ۸��������ͼ,Ѱ�ҶԷ�����Ч������           'ccggggbbbbyyyymmmmmmrrr','o*o*+^o*+^o*+^o*+^<>o*+'
%ansys_price_data=[stCount_Member_MisSum,stCount_Member_DisMean,stCount_Member_DisStd];  %1�۲��
%ansys_price_data=[stCount_Member_CreMean,stCount_Member_CreStd];                        %2�۲�ô˶����ؾ��з������ԣ�stCount_Member_CreMean,stCount_Member_CreStd(:,2)
%ansys_price_data=[stCount_Mission_DisMean,stCount_Mission_DisStd,stDis_Member_Count];   %3�۲��stDis_Member_Count(:,3)���з�������
%ansys_price_data=[stDis_Member_MisSum,stDis_Mission_Count];                             %4�۲��stDis_Member_MisSum,stDis_Mission_Count(:,3)���з�������
%ansys_price_data=[stKer_Mission_Distance,stMemberKer_Mission_Distance];                 %5�۲��
%ansys_price_data=[stDis_Member_CreMean,stDis_Member_DisMean,stDis_Mission_DisMean];     %6�۲��stDis_Member_CreMean(:,2)
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','�۸�����ͼ','Colormap',cool);
% gplotmatrix(ansys_price_data,compl_Mission_price,[],'rgbymc','o*+^<>',2);             %����Ҫ���ط����������ɢ�����ͼ�۲�����ضԼ۸��Ӱ��
%%
% %�������۹������ɷ�
% ansys_major_data=[stCount_Member_CreMean(:,1),stCount_Member_CreStd(:,2),stDis_Member_CreMean(:,2),stDis_Member_Count(:,3),...
%     stDis_Member_MisSum(:,3),stDis_Mission_Count(:,3)]; %������Ҫ���ط�������
% [pcx,scorex,latentx,tsquarex]=princomp(ansys_major_data);
% ratio_latentx=latentx./sum(latentx);sum(ratio_latentx(1:3));
%   %����Ч���ؽ�������������ɵ�����3���������ռȫ�������92.3%��
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','�۸����ͼ','Colormap',cool);
% %scatter(scorex(:,1),scorex(:,2),6,compl_Mission_price,'full','o')
% scatter3(scorex(:,1),scorex(:,2),scorex(:,3),6,compl_Mission_price,'full','o')
% %������������۸�ɢ�㣬�ɼ��������ضԸ�����ֵ�����ܶȵ��γɵĵͼ۸���������׼ȷ���Ե�����ֵ�����ܶ�������޷�׼ȷ���֣����ƻ�������������ֵ����ȱʧ�йء�
%%
% %Ӧ�����Իع鷨��ģ
% %linearAnsys_Price=[stDis_Member_CreMean,stCount_Member_MisSum,stCount_Member_CreMean,stDis_Mission_Count,stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% 
% % %����Ҫ����Ϊ�ع��������
% % X=[ones(length(scorex(:,1)),1),scorex(:,1:3),scorex(:,1).*scorex(:,2),scorex(:,1).*scorex(:,3),scorex(:,1).*scorex(:,2).*scorex(:,3)];
% % Y=compl_Mission_price;
% % �Ի�Ա��������ƽ��ֵ��������������Ϊ�ع��������
% linearAnsys_Price=[stCount_Member_CreMean(:,3),stDis_Mission_Count(:,2),stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% X=[ones(size(linearAnsys_Price(:,1))),linearAnsys_Price];
% Y=compl_Mission_price;
% %stepwise(X,Y);  %�ֲ��ع飬ȷ���ɿ����������
% [b,bint,r,rint,stats]=regress(Y,X,0.05);
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','�۸����ͼ','Colormap',cool);
% hist(r,30); %�ع����ͳ��ͼʾ
% %�����ʾЧ�����ã����̫��;
%%
%��������ɰ����ɷ�
% Y=[compl_Mission,stCount_Member_MisSum,stCount_Member_DisMean,stCount_Member_CreMean,stCount_Mission_DisMean,stCount_Mission_PriMean+repmat(stCompl_Mission_Price,1,3)];
% [pcy,scorey,latenty,tsquarey]=princomp(Y);
%�������������ȷ�����ɷ�stCompl_Mission_Price+stCount_Mission_PriMean��stCount_Mission_DisMean��stCount_Member_DisMean��������
%%
% %���������������
% ansys_Data=[compl_Mission,stCompl_Mission_Price,...
%     stDis_Member_Count,stDis_Member_CreMean,...
%     stDis_Member_DisMean,stDis_Member_MisSum,...
%     stDis_Mission_Count,stDis_Mission_PriSum,...
%     stDis_Mission_DisMean];
% X=ansys_Data(:,2:23);
% Y=ansys_Data(:,1);
% %[pc,score,latent,tsquare]=princomp(X)  %���ɷַ���
% %[ndim,prob,chisquare]=barttest(X,0.05)
% %[b,bint,r,rint,stats]=regress(Y,X,0.05)
 %%
% %����ָ���뾶����Ч����������Ч��Ա���Ķ�άɢ��ͼ��������۸���顣����۸�65-74.5���䰴0.5Ԫ������75-85���䰴5Ԫ������ccggggbbbbyyyymmmmmmwww
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','�۸����ͼ');
% %gscatter(ansys_Data(:,8),ansys_Data(:,5),ansys_Data(:,2),'cgbyr','*o<+.',5)
% %gplotmatrix(ansys_Data(:,6:8),ansys_Data(:,3:5),ansys_Data(:,1),'cgwww','o',5)
% scatter3(ansys_Data(:,6),ansys_Data(:,7),ansys_Data(:,9),6,ansys_Data(:,1),'full','o')
% xlabel('stDis_Mission_Count');
% ylabel('stDis_Member_CreMean');
% zlabel('stKer_Mission_Distance')
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

