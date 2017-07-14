%分析任务点的本身价格,周围任务总价格、任务密集度，会员密集度，会员信誉度与任务完成情况关系
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='m1';                                                 %读取已结束项目任务数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
%   stCompl_Mission_Price			任务价格					
% 	stCount_Member_MisSum			定会员数的任务总数
% 	stCount_Member_DisMean			定会员数的会员平均距离		stCount_Member_DisStd
% 	stCount_Member_CreMean      	定会员数的平均信誉值 2	 stCount_Member_CreStd
% 	stCount_Mission_DisMean     	定任务数的任务平均距离		stCount_Mission_DisStd 
% 	stCount_Mission_PriMean     	定任务数的任务平均价格		stCount_Mission_PriStd
% 	stDis_Member_Count          	定距离的会员总数 3			
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
%%
% %分析定价规则主成分
% ansys_major_data=[stCount_Member_CreMean(:,1),stCount_Member_CreStd(:,2),stDis_Member_CreMean(:,2),stDis_Member_Count(:,3),...
%     stDis_Member_MisSum(:,3),stDis_Mission_Count(:,3)]; %构建主要因素分析矩阵
% [pcx,scorex,latentx,tsquarex]=princomp(ansys_major_data);
% ratio_latentx=latentx./sum(latentx);sum(ratio_latentx(1:3));
%   %对有效因素进行主因分析，可得主因3个，方差和占全部方差的92.3%。
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','价格分类图','Colormap',cool);
% %scatter(scorex(:,1),scorex(:,2),6,compl_Mission_price,'full','o')
% scatter3(scorex(:,1),scorex(:,2),scorex(:,3),6,compl_Mission_price,'full','o')
% %作三个主因与价格散点，可见所有因素对高信誉值、低密度的形成的低价格任务点估计准确；对低信誉值、高密度任务点无法准确区分，估计还有任务点自身价值因素缺失有关。
%%
% %应用线性回归法建模
% %linearAnsys_Price=[stDis_Member_CreMean,stCount_Member_MisSum,stCount_Member_CreMean,stDis_Mission_Count,stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% 
% % %以主要因素为回归输入参数
% % X=[ones(length(scorex(:,1)),1),scorex(:,1:3),scorex(:,1).*scorex(:,2),scorex(:,1).*scorex(:,3),scorex(:,1).*scorex(:,2).*scorex(:,3)];
% % Y=compl_Mission_price;
% % 以会员定数信誉平均值，定距任务总数为回归输入参数
% linearAnsys_Price=[stCount_Member_CreMean(:,3),stDis_Mission_Count(:,2),stCount_Member_CreMean(:,3).*stDis_Mission_Count(:,2)];
% X=[ones(size(linearAnsys_Price(:,1))),linearAnsys_Price];
% Y=compl_Mission_price;
% %stepwise(X,Y);  %分步回归，确定可靠的输入参数
% [b,bint,r,rint,stats]=regress(Y,X,0.05);
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','价格分析图','Colormap',cool);
% hist(r,30); %回归误差统计图示
% %结果显示效果不好，误差太大;
%%
%分析任务成败主成分
% Y=[compl_Mission,stCount_Member_MisSum,stCount_Member_DisMean,stCount_Member_CreMean,stCount_Mission_DisMean,stCount_Mission_PriMean+repmat(stCompl_Mission_Price,1,3)];
% [pcy,scorey,latenty,tsquarey]=princomp(Y);
%分析结果，可以确定良成分stCompl_Mission_Price+stCount_Mission_PriMean，stCount_Mission_DisMean，stCount_Member_DisMean，第三组
%%
% %构造分析参数矩阵
% ansys_Data=[compl_Mission,stCompl_Mission_Price,...
%     stDis_Member_Count,stDis_Member_CreMean,...
%     stDis_Member_DisMean,stDis_Member_MisSum,...
%     stDis_Mission_Count,stDis_Mission_PriSum,...
%     stDis_Mission_DisMean];
% X=ansys_Data(:,2:23);
% Y=ansys_Data(:,1);
% %[pc,score,latent,tsquare]=princomp(X)  %主成分分析
% %[ndim,prob,chisquare]=barttest(X,0.05)
% %[b,bint,r,rint,stats]=regress(Y,X,0.05)
 %%
% %绘制指定半径内有效任务数、有效会员数的二维散点图，以任务价格分组。任务价格65-74.5区间按0.5元递增，75-85区间按5元递增。ccggggbbbbyyyymmmmmmwww
% scrsz = get(0,'ScreenSize');
% hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
% set(hF1,'Name','价格分析图');
% %gscatter(ansys_Data(:,8),ansys_Data(:,5),ansys_Data(:,2),'cgbyr','*o<+.',5)
% %gplotmatrix(ansys_Data(:,6:8),ansys_Data(:,3:5),ansys_Data(:,1),'cgwww','o',5)
% scatter3(ansys_Data(:,6),ansys_Data(:,7),ansys_Data(:,9),6,ansys_Data(:,1),'full','o')
% xlabel('stDis_Mission_Count');
% ylabel('stDis_Member_CreMean');
% zlabel('stKer_Mission_Distance')
%% 
% %绘制指定半径内有效任务数、有效会员数、任务价格的三维散点图，以红色*表示未完成，绿色O表示完成。
% ansys_Data1=[compl_Mission,compl_Mission_price,stat_Mission_Count,stat_Member_Count];
% figure;
% gscatter(ansys_Data1(:,7),ansys_Data1(:,5),ansys_Data1(:,1),'rb','xo');
%%
% %计算按5km半径内有效任务数统计相应的平均价格、价格标准差、符合条件的任务数、会员信誉值的值加上会员信誉的标准差，记入result_Data2矩阵。
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

