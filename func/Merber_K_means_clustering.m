%对会员地点进行聚类，分为k个聚类
clear all
pathWriteMat='E:\ana\mat\';%记录计算数据文件路径
%%
token='m2';%会员信息数据文件名
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'member_Lat_Lon','member_Mission_Limit','member_Mission_Begin_Time','member_Credit','member_ID');
%%
opts = statset('Display','final');
k=5;%设聚类数
[idx_member,ctrs_member] = kmeans(member_Lat_Lon,k,...
                    'Distance','city',...
                    'Replicates',5,...
                    'Options',opts);
for id=1:length(member_Lat_Lon(:,1))
    kernel_member_Distance(id,1)=deg2km(distance(ctrs_member(idx_member(id),1),ctrs_member(idx_member(id),2),member_Lat_Lon(id,1),member_Lat_Lon(id,2))); 
end
token='kernel_member_distance';                                     %记录会员聚类中心与会员的距离参数文件
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'kernel_member_Distance','idx_member','ctrs_member');
scrsz = get(0,'ScreenSize');
hF1=figure('Position',[scrsz(3)/8 scrsz(4)/15 scrsz(3)*4/5 scrsz(4)*4/5]);
set(hF1,'Name','会员聚类分析');
pattern=['r.';'b*';'g.';'y.';'c.';'m.';'r+';'b+';'g+';'y+';'c+';'m+'];
for i=1:k
    plot(member_Lat_Lon(idx_member==i,1),member_Lat_Lon(idx_member==i,2),pattern(i,:),'MarkerSize',6)
    hold on
end
plot(ctrs_member(:,1),ctrs_member(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(ctrs_member(:,1),ctrs_member(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)