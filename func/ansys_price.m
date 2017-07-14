%分析任务点的本身价格,周围任务总价格、任务密集度，会员密集度，会员信誉度与任务完成情况关系
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='m1';                                                 %读取已结束项目任务数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
%   stCompl_Mission_Price			任务价格					
%   选择20人，30人，50人统计
% 	stCount_Member_MisSum			定会员数的任务总数，
% 	stCount_Member_DisMean			定会员数的会员平均距离		stCount_Member_DisStd
% 	stCount_Member_CreMean      	定会员数的平均信誉值 2	 stCount_Member_CreStd
% 	选择2个任务，5个任务，10个任务
% 	stCount_Mission_DisMean     	定任务数的任务平均距离		stCount_Mission_DisStd
% 	stCount_Mission_PriMean     	定任务数的任务平均价格		stCount_Mission_PriStd
% 	选择2公里，5公里，16公里
%   stDis_Member_Count          	定距离的会员总数 3			
% 	stDis_Member_CreMean        	定距离的平均会员信誉值 4	stDis_Member_CreStd
% 	stDis_Member_DisMean        	定距离的会员平均距离		 stDis_Member_DisStd
% 	stDis_Member_MisSum         	定距离的会员所拥有的任务总数
% 	stDis_Mission_Count         	定距离的任务总数
% 	stDis_Mission_PriMean       	定距离的任务平均价格		stDis_Mission_PriStd  
% 	stDis_Mission_DisMean       	定距离的任务平均距离		stDis_Mission_DisStd 
% 	stKer_Mission_Distance 			任务聚类中心距任务距离
% 	stMemberKer_Mission_Distance	会员中心与各任务的最小距离
% 	stKer_Member_Distance 			会员到其会员中心的距离
token='stand_Data';                                     %读取标准化的分析用数据文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
load(savefilename,'stCompl_Mission_Price','stCount_Member_MisSum','stCount_Member_DisMean','stCount_Member_DisStd',...
	'stCount_Member_CreMean','stCount_Member_CreStd','stCount_Mission_DisMean','stCount_Mission_DisStd',...
	'stCount_Mission_PriMean','stCount_Mission_PriStd','stDis_Member_Count','stDis_Member_CreSum','stDis_Member_CreMean','stDis_Member_CreStd',...
	'stDis_Member_DisSum','stDis_Member_DisMean','stDis_Member_DisStd','stDis_Member_MisSum','stDis_Mission_Count',...
	'stDis_Mission_PriSum','stDis_Mission_PriMean','stDis_Mission_PriStd','stDis_Mission_DisSum','stDis_Mission_DisMean','stDis_Mission_DisStd',...
	'stKer_Mission_Distance','stMemberKer_Mission_Distance','stKer_Member_Distance');
%%
%NaN数据处理，由于定距离统计时在一定距离内存在无会员和无任务可能，又不可能扩大距离以适应个别任务特别情况只有区别NaN，分别处理。
%stDis_Member_CreMean stDis_Member_CreStd stDis_Member_DisMean stDis_Member_DisStd
%stDis_Mission_DisMean stDis_Mission_DisStd stDis_Mission_PriMean stDis_Mission_PriStd
% allNaN_Member_CreMean=[compl_Mission_price,stDis_Member_CreMean];
% naN_Member_CreMean=allNaN_Member_CreMean(isnan(stDis_Member_CreMean(:,1)),:);
%%
% %因素相关性分析
% ansys_relativity_data=[stCompl_Mission_Price,stCount_Member_MisSum,stCount_Member_DisMean,stCount_Member_DisStd,...
% 	stCount_Member_CreMean,stCount_Member_CreStd,stCount_Mission_DisMean,stCount_Mission_DisStd,...
% 	stDis_Member_Count,stDis_Member_MisSum,stDis_Mission_Count,stKer_Mission_Distance,stMemberKer_Mission_Distance];
% result_relat=corrcoef(ansys_relativity_data);
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','因素相关性图','Colormap',cool);
% gplotmatrix(result_relat(:,1:5),(1:33)',[],'rgbymc','o*+^<>',2);%用主要因素分析矩阵绘制散点矩阵图观察各因素对价格的影响
%%
% 因素对价格分类作用图,寻找对分类有效的因素           'ccggggbbbbyyyymmmmmmrrr','o*o*+^o*+^o*+^o*+^<>o*+'
%ansys_price_data=[stCount_Member_MisSum,stCount_Member_DisMean,stCount_Member_DisStd];  %1观察得
%ansys_price_data=[stCount_Member_CreMean,stCount_Member_CreStd];                        %2观察得此二因素具有分类特性，stCount_Member_CreMean,stCount_Member_CreStd(:,2)
%ansys_price_data=[stCount_Mission_DisMean,stCount_Mission_DisStd,stDis_Member_Count];   %3观察得stDis_Member_Count(:,3)具有分类特性
%ansys_price_data=[stDis_Member_MisSum,stDis_Mission_Count];                             %4观察得stDis_Member_MisSum,stDis_Mission_Count(:,3)具有分类特性
%ansys_price_data=[stKer_Mission_Distance,stMemberKer_Mission_Distance];                 %5观察得
%ansys_price_data=[stDis_Member_CreMean,stDis_Member_DisMean,stDis_Mission_DisMean];     %6观察得stDis_Member_CreMean(:,2)
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','价格因素图','Colormap',cool);
% gplotmatrix(ansys_price_data,compl_Mission_price,[],'rgbymc','o*+^<>',2);             %用主要因素分析矩阵绘制散点矩阵图观察各因素对价格的影响
% %%
% %分析定价规则主成分
% ansys_major_data=[stCount_Member_CreMean(:,2),stCount_Member_CreStd(:,2),stDis_Member_CreSum(:,2),stDis_Member_Count(:,2),...
%     stDis_Member_MisSum(:,2),stDis_Mission_Count(:,2),stDis_Member_DisSum(:,2),stDis_Mission_DisSum(:,2)]; %构建主要因素分析矩阵
% [pcx,scorex,latentx,tsquarex]=princomp(ansys_major_data);
% ratio_latentx=100.*latentx./sum(latentx);figure;pareto(ratio_latentx);    %显示因素方差增长情况
%   %对有效因素进行主因分析，可得主因3个，方差和占全部方差的92.3%。
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','价格分类图','Colormap',cool);
% %scatter(scorex(:,1),scorex(:,2),6,compl_Mission_price,'full','o')
% scatter3(scorex(:,1),scorex(:,2),scorex(:,3),6,compl_Mission_price,'full','o')
% %作三个主因与价格散点图，可见三个主因坐标下低于65的价格的任务与其它任务有区别（任务密、信誉高的任务价格一定低于70）；其它价格在三个主因下没有呈现特别的聚类特征；
% %因此，任务本身的价值影响不能忽略。
%%
% %应用线性回归法建模
% %linearAnsys_Price=[stDis_Member_CreMean,stCount_Member_MisSum,stCount_Member_CreMean,stDis_Mission_Count,stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% X=[ones(size(linearAnsys_Price(:,1))),linearAnsys_Price];
% Y=compl_Mission_price;
% %stepwise(X,Y);  %分步回归，确定可靠的输入参数
% 
% % %以主要因素为回归输入参数
% % X=[ones(length(scorex(:,1)),1),scorex(:,1:3),scorex(:,1).*scorex(:,2),scorex(:,1).*scorex(:,3),scorex(:,1).*scorex(:,2).*scorex(:,3)];
% % Y=compl_Mission_price;
%
% % 以会员定数信誉平均值，定距任务总数为回归输入参数
% linearAnsys_Price=[stCount_Member_CreMean(:,3),stDis_Mission_Count(:,2),stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% X=[ones(size(linearAnsys_Price(:,1))),linearAnsys_Price];
% Y=compl_Mission_price;
% [b,bint,r,rint,stats]=regress(Y,X,0.05);
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','价格分析图','Colormap',cool);
% hist(r,30); %回归误差统计图示
% %结果显示效果不好，误差太大;
%%
% %任务点价格频数分布检验
% %price_frequency=tabulate(compl_Mission_price);
% %按65-70，70-72，72-75分三个小区选取数据集合；
% filter_65=compl_Mission_price(compl_Mission_price<70);                          %65-70小区集合
% filter_70=compl_Mission_price(compl_Mission_price<72&compl_Mission_price>=70);  %70-72小区集合
% filter_72=compl_Mission_price(compl_Mission_price<75&compl_Mission_price>=72);  %72-75小区集合
% %整个大区的原始价格数据按65-70、70-75、75、80、85分为5个大区重新归类；
% filter_85=(compl_Mission_price<70)*65+(compl_Mission_price<75&compl_Mission_price>=70)*70+(compl_Mission_price==75)*75+(compl_Mission_price==80)*80+(compl_Mission_price==85)*85;
% %65-70小区的泊松分布检验
% [l65,lci65] = poissfit(filter_65);
% test_cdf = [filter_65,cdf('poiss',filter_65,l65)];
% h_65 = kstest(filter_65,'CDF',test_cdf);            %拒绝价格按泊松分布的假设
% [h,p] = kstest2(filter_65,filter_70,'Alpha',0.01);  %65-70小区集合\70-72小区集合频数分布差异显著
% [h_n65,p_n65,k_n65,c_n65] = lillietest(filter_65);  %拒绝价格按正态分布的假设
%%
% %分析一定价格下5km内会员信誉值、任务数及最近20人平均信誉值的数据分布规律
% analyze_Price=[compl_Mission_price,stDis_Member_CreSum(:,2),stCount_Member_CreMean(:,2),stDis_Mission_Count(:,2)];
% %按价格85、80、75、75-72、72-70、70-65的分类
% filPric_85=analyze_Price(compl_Mission_price==85,:);
% filPric_80=analyze_Price(compl_Mission_price==80,:);
% filPric_75=analyze_Price(compl_Mission_price==75,:);
% filPric_72=analyze_Price((compl_Mission_price<75&compl_Mission_price>=72),:);
% filPric_70=analyze_Price((compl_Mission_price<72&compl_Mission_price>=70),:);
% filPric_65=analyze_Price(compl_Mission_price<70,:);
% %绘制不同价格的
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','按价格分类的因素/频数图','Colormap',cool);
% hold on
% subW6=subplot(6,1,6);
% set(subW6,'Position',[0.13 0.032 0.775 0.088]);
% hist(filPric_85(:,2:4));                                        %价格85的任务特征
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
% hist(filPric_80(:,2:4));                                        %价格80的任务特征
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
% hist(filPric_75(:,2:4));                                        %价格75的任务特征
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
% hist(filPric_72(:,2:4));                                        %价格72的任务特征
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
% hist(filPric_70(:,2:4));                                        %价格70的任务特征
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
% hist(filPric_65(:,2:4));                                        %价格65的任务特征
% axis([0 7 0 320]);
% ylabel('65');
% h1 = gca;
% set(h1,'XGrid','on','YGrid','on');
% set(h1,'YTick',[0 80 160 240 320]);
% set(h1,'YTickLabel',[0;100;200;300;400]);
% set(h1,'XTick',[ 0      1      2      3      4      5      6      7]);
% set(h1,'XTickLabel',['0';'1';'2';'3';'4';'5';'6';'7']);
%%
% %绘制5km半径内stDis_Member_CreSum(:,2)以0.15为界，价格频数分布图ccggggbbbbyyyymmmmmmwww,cgwww
% analyze_Price=[compl_Mission_price,stDis_Member_CreSum(:,2),stCount_Member_CreMean(:,2),stDis_Mission_Count(:,2)];
% filPric_015=analyze_Price(stDis_Member_CreSum(:,2)<0.15,:);
% filPric_07=analyze_Price(stDis_Member_CreSum(:,2)>=0.15,:);
% % scrsz = get(0,'ScreenSize');
% % hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% % set(hF1,'Name','会员信誉度大于0.15任务点价格分析图');
% % hist(filPric_07(:,1));
% freprice_07=tabulate(filPric_07(:,1));
% freprice_07Sum=sum(freprice_07(:,2));
% freprice_015=tabulate(filPric_015(:,1));
% freprice_015Sum=sum(freprice_015(:,2)); 
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','价格因素图','Colormap',cool);
% %gplotmatrix(filPric_015(:,2:4),filPric_015(:,1),[],'rgbymc','o*+^<>',2);             %用主要因素分析矩阵绘制散点矩阵图观察各因素对价格的影响
% %gscatter(ansys_Data(:,8),ansys_Data(:,5),ansys_Data(:,2),'cgbyr','*o<+.',5)
% gplotmatrix(filPric_015(:,2:4),filPric_015(:,2:4),filPric_015(:,1),'ccggggbbbbyyyymmmmmmrrr','o',5)
% % scatter3(ansys_Data(:,6),ansys_Data(:,7),ansys_Data(:,9),6,ansys_Data(:,1),'full','o')
%%
% %计算按5km半径内有效任务数统计相应的平均价格、价格标准差、符合条件的任务数、会员信誉值的值加上会员信誉的标准差，记入result_Data2矩阵。用于求取拟合函数。
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

