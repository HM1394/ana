%���������ı���۸�,��Χ�����ܼ۸������ܼ��ȣ���Ա�ܼ��ȣ���Ա��������������������ϵ
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
%%
token='m1';                                                 %��ȡ�ѽ�����Ŀ���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
%   stCompl_Mission_Price			����۸�					
%   ѡ��20�ˣ�30�ˣ�50��ͳ��
% 	stCount_Member_MisSum			����Ա��������������
% 	stCount_Member_DisMean			����Ա���Ļ�Աƽ������		stCount_Member_DisStd
% 	stCount_Member_CreMean      	����Ա����ƽ������ֵ 2	 stCount_Member_CreStd
% 	ѡ��2������5������10������
% 	stCount_Mission_DisMean     	��������������ƽ������		stCount_Mission_DisStd
% 	stCount_Mission_PriMean     	��������������ƽ���۸�		stCount_Mission_PriStd
% 	ѡ��2���5���16����
%   stDis_Member_Count          	������Ļ�Ա���� 3			
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
% %%
% %�������۹������ɷ�
% ansys_major_data=[stCount_Member_CreMean(:,2),stCount_Member_CreStd(:,2),stDis_Member_CreSum(:,2),stDis_Member_Count(:,2),...
%     stDis_Member_MisSum(:,2),stDis_Mission_Count(:,2),stDis_Member_DisSum(:,2),stDis_Mission_DisSum(:,2)]; %������Ҫ���ط�������
% [pcx,scorex,latentx,tsquarex]=princomp(ansys_major_data);
% ratio_latentx=100.*latentx./sum(latentx);figure;pareto(ratio_latentx);    %��ʾ���ط����������
%   %����Ч���ؽ�������������ɵ�����3���������ռȫ�������92.3%��
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','�۸����ͼ','Colormap',cool);
% %scatter(scorex(:,1),scorex(:,2),6,compl_Mission_price,'full','o')
% scatter3(scorex(:,1),scorex(:,2),scorex(:,3),6,compl_Mission_price,'full','o')
% %������������۸�ɢ��ͼ���ɼ��������������µ���65�ļ۸���������������������������ܡ������ߵ�����۸�һ������70���������۸�������������û�г����ر�ľ���������
% %��ˣ�������ļ�ֵӰ�첻�ܺ��ԡ�
%%
% %Ӧ�����Իع鷨��ģ
% %linearAnsys_Price=[stDis_Member_CreMean,stCount_Member_MisSum,stCount_Member_CreMean,stDis_Mission_Count,stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% X=[ones(size(linearAnsys_Price(:,1))),linearAnsys_Price];
% Y=compl_Mission_price;
% %stepwise(X,Y);  %�ֲ��ع飬ȷ���ɿ����������
% 
% % %����Ҫ����Ϊ�ع��������
% % X=[ones(length(scorex(:,1)),1),scorex(:,1:3),scorex(:,1).*scorex(:,2),scorex(:,1).*scorex(:,3),scorex(:,1).*scorex(:,2).*scorex(:,3)];
% % Y=compl_Mission_price;
%
% % �Ի�Ա��������ƽ��ֵ��������������Ϊ�ع��������
% linearAnsys_Price=[stCount_Member_CreMean(:,3),stDis_Mission_Count(:,2),stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% X=[ones(size(linearAnsys_Price(:,1))),linearAnsys_Price];
% Y=compl_Mission_price;
% [b,bint,r,rint,stats]=regress(Y,X,0.05);
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','�۸����ͼ','Colormap',cool);
% hist(r,30); %�ع����ͳ��ͼʾ
% %�����ʾЧ�����ã����̫��;
%%
% %�����۸�Ƶ���ֲ�����
% %price_frequency=tabulate(compl_Mission_price);
% %��65-70��70-72��72-75������С��ѡȡ���ݼ��ϣ�
% filter_65=compl_Mission_price(compl_Mission_price<70);                          %65-70С������
% filter_70=compl_Mission_price(compl_Mission_price<72&compl_Mission_price>=70);  %70-72С������
% filter_72=compl_Mission_price(compl_Mission_price<75&compl_Mission_price>=72);  %72-75С������
% %����������ԭʼ�۸����ݰ�65-70��70-75��75��80��85��Ϊ5���������¹��ࣻ
% filter_85=(compl_Mission_price<70)*65+(compl_Mission_price<75&compl_Mission_price>=70)*70+(compl_Mission_price==75)*75+(compl_Mission_price==80)*80+(compl_Mission_price==85)*85;
% %65-70С���Ĳ��ɷֲ�����
% [l65,lci65] = poissfit(filter_65);
% test_cdf = [filter_65,cdf('poiss',filter_65,l65)];
% h_65 = kstest(filter_65,'CDF',test_cdf);            %�ܾ��۸񰴲��ɷֲ��ļ���
% [h,p] = kstest2(filter_65,filter_70,'Alpha',0.01);  %65-70С������\70-72С������Ƶ���ֲ���������
% [h_n65,p_n65,k_n65,c_n65] = lillietest(filter_65);  %�ܾ��۸���̬�ֲ��ļ���
%%
% %����һ���۸���5km�ڻ�Ա����ֵ�������������20��ƽ������ֵ�����ݷֲ�����
% analyze_Price=[compl_Mission_price,stDis_Member_CreSum(:,2),stCount_Member_CreMean(:,2),stDis_Mission_Count(:,2)];
% %���۸�85��80��75��75-72��72-70��70-65�ķ���
% filPric_85=analyze_Price(compl_Mission_price==85,:);
% filPric_80=analyze_Price(compl_Mission_price==80,:);
% filPric_75=analyze_Price(compl_Mission_price==75,:);
% filPric_72=analyze_Price((compl_Mission_price<75&compl_Mission_price>=72),:);
% filPric_70=analyze_Price((compl_Mission_price<72&compl_Mission_price>=70),:);
% filPric_65=analyze_Price(compl_Mission_price<70,:);
% %���Ʋ�ͬ�۸��
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','���۸���������/Ƶ��ͼ','Colormap',cool);
% hold on
% subW6=subplot(6,1,6);
% set(subW6,'Position',[0.13 0.032 0.775 0.088]);
% hist(filPric_85(:,2:4));                                        %�۸�85����������
% axis([0 7 0 32]);
% ylabel('85');
% h6 = gca;
% set(h6,'XGrid','on','YGrid','on');
% set(h6,'YTick',[0 8 16 24 32]);
% set(h6,'YTickLabel',[0;8;16;24;32]);
% set(h6,'XTick',[ 0      1      2      3      4      5      6      7]);
% set(h6,'XTickLabel',['0';'1';'2';'3';'4';'5';'6';'7']);
% subW5=subplot(6,1,5);
% set(subW5,'Position',[0.13 0.171 0.775 0.088]);
% hist(filPric_80(:,2:4));                                        %�۸�80����������
% axis([0 7 0 12]);
% ylabel('80');
% h5 = gca;
% set(h5,'XGrid','on','YGrid','on');
% set(h5,'YTick',[0 3 6 9 12]);
% set(h5,'YTickLabel',[0;3;6;9;12]);
% set(h5,'XTick',[ 0      1      2      3      4      5      6      7]);
% set(h5,'XTickLabel',['0';'1';'2';'3';'4';'5';'6';'7']);
% subW4=subplot(6,1,4);
% set(subW4,'Position',[0.13 0.31 0.775 0.088]);
% hist(filPric_75(:,2:4));                                        %�۸�75����������
% axis([0 7 0 100]);
% ylabel('75');
% h4 = gca;
% set(h4,'XGrid','on','YGrid','on');
% set(h4,'YTick',[0 25 50 75 100]);
% set(h4,'YTickLabel',[0;25;50;75;100]);
% set(h4,'XTick',[ 0      1      2      3      4      5      6      7]);
% set(h4,'XTickLabel',['0';'1';'2';'3';'4';'5';'6';'7']);
% subW3=subplot(6,1,3);
% set(subW3,'Position',[0.13 0.449 0.775 0.088]);
% hist(filPric_72(:,2:4));                                        %�۸�72����������
% axis([0 7 0 100]);
% ylabel('72');
% h3 = gca;
% set(h3,'XGrid','on','YGrid','on');
% set(h3,'YTick',[0 25 50 75 100]);
% set(h3,'YTickLabel',[0;25;50;75;100]);
% set(h3,'XTick',[ 0      1      2      3      4      5      6      7]);
% set(h3,'XTickLabel',['0';'1';'2';'3';'4';'5';'6';'7']);
% subW2=subplot(6,1,2);
% set(subW2,'Position',[0.13 0.588 0.775 0.088]);
% hist(filPric_70(:,2:4));                                        %�۸�70����������
% axis([0 7 0 120]);
% ylabel('70');
% h2 = gca;
% set(h2,'XGrid','on','YGrid','on');
% set(h2,'YTick',[0 30 60 90 120]);
% set(h2,'YTickLabel',[0;30;60;90;120]);
% set(h2,'XTick',[ 0      1      2      3      4      5      6      7]);
% set(h2,'XTickLabel',['0';'1';'2';'3';'4';'5';'6';'7']);
% subW1=subplot(6,1,1);
% set(subW1,'Position',[0.13 0.737 0.775 0.188]);
% hist(filPric_65(:,2:4));                                        %�۸�65����������
% axis([0 7 0 320]);
% ylabel('65');
% h1 = gca;
% set(h1,'XGrid','on','YGrid','on');
% set(h1,'YTick',[0 80 160 240 320]);
% set(h1,'YTickLabel',[0;100;200;300;400]);
% set(h1,'XTick',[ 0      1      2      3      4      5      6      7]);
% set(h1,'XTickLabel',['0';'1';'2';'3';'4';'5';'6';'7']);
%%
% %����5km�뾶��stDis_Member_CreSum(:,2)��0.15Ϊ�磬�۸�Ƶ���ֲ�ͼccggggbbbbyyyymmmmmmwww,cgwww
% analyze_Price=[compl_Mission_price,stDis_Member_CreSum(:,2),stCount_Member_CreMean(:,2),stDis_Mission_Count(:,2)];
% filPric_015=analyze_Price(stDis_Member_CreSum(:,2)<0.15,:);
% filPric_07=analyze_Price(stDis_Member_CreSum(:,2)>=0.15,:);
% % scrsz = get(0,'ScreenSize');
% % hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% % set(hF1,'Name','��Ա�����ȴ���0.15�����۸����ͼ');
% % hist(filPric_07(:,1));
% freprice_07=tabulate(filPric_07(:,1));
% freprice_07Sum=sum(freprice_07(:,2));
% freprice_015=tabulate(filPric_015(:,1));
% freprice_015Sum=sum(freprice_015(:,2)); 
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','�۸�����ͼ','Colormap',cool);
% %gplotmatrix(filPric_015(:,2:4),filPric_015(:,1),[],'rgbymc','o*+^<>',2);             %����Ҫ���ط����������ɢ�����ͼ�۲�����ضԼ۸��Ӱ��
% %gscatter(ansys_Data(:,8),ansys_Data(:,5),ansys_Data(:,2),'cgbyr','*o<+.',5)
% gplotmatrix(filPric_015(:,2:4),filPric_015(:,2:4),filPric_015(:,1),'ccggggbbbbyyyymmmmmmrrr','o',5)
% % scatter3(ansys_Data(:,6),ansys_Data(:,7),ansys_Data(:,9),6,ansys_Data(:,1),'full','o')
%%
% %���㰴5km�뾶����Ч������ͳ����Ӧ��ƽ���۸񡢼۸��׼���������������������Ա����ֵ��ֵ���ϻ�Ա�����ı�׼�����result_Data2����������ȡ��Ϻ�����
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

