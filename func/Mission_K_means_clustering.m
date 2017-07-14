%对任务地点进行聚类，分为k个聚类
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='m1';                                                 %读取已结束项目任务数据文件
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
opts = statset('Display','final');
k=5;%设聚类数
[idx_mission,ctrs_mission] = kmeans(compl_Mission_lat_lon,k,...
                    'Distance','city',...
                    'Replicates',5,...
                    'Options',opts);
for id=1:length(compl_Mission_lat_lon(:,1))
    kernel_mission_Distance(id,1)=deg2km(distance(ctrs_mission(idx_mission(id),1),ctrs_mission(idx_mission(id),2),compl_Mission_lat_lon(id,1),compl_Mission_lat_lon(id,2))); 
end
token='kernel_missio_distance';                                     %记录任务聚类中心与任务的距离参数文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'kernel_mission_Distance','idx_mission','ctrs_mission');
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','任务聚类分析');
pattern=['r.';'b*';'g.';'y.';'c.';'m.';'r+';'b+';'g+';'y+';'c+';'m+'];
for i=1:k
    plot(compl_Mission_lat_lon(idx_mission==i,1),compl_Mission_lat_lon(idx_mission==i,2),pattern(i,:),'MarkerSize',6)
    hold on
end
plot(ctrs_mission(:,1),ctrs_mission(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(ctrs_mission(:,1),ctrs_mission(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)