%%
%��m2�ļ����������������������ʱ��ȷ����Ч��Ա��š�Ԥ�Ʒֵ���������
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
token1='m2';%��Ա��Ϣ�����ļ���
loadfilename1=strcat(strcat(pathWriteMat,token1),'.mat');
load(loadfilename1,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID');
token2='m1';%�ѽ�����Ŀ���������ļ���
loadfilename2=strcat(strcat(pathWriteMat,token2),'.mat');
load(loadfilename2,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
log_valid_Credit=full_member_Credit>0&full_member_Credit<20000 ;                %�������ֵС��10��Ա
full_member_IDnum=str2num(full_member_ID(:,2:length(full_member_ID(1,:))));%��Ա��Ÿ�Ϊ��������
mid_member_IDnum=full_member_IDnum(log_valid_Credit);
mid_member_Lat_Lon=full_member_Lat_Lon(log_valid_Credit,:);
mid_member_Mission_Limit=full_member_Mission_Limit(log_valid_Credit);
mid_member_Mission_Begin_Time=full_member_Mission_Begin_Time(log_valid_Credit);
mid_member_Credit=full_member_Credit(log_valid_Credit);
%������䷽��
ratio_Mission_Distribution=mid_member_Mission_Limit./sum(mid_member_Mission_Limit);%�������޶���������ռ����
total_Mission_Count=length(compl_Mission_ID);
value_Mission_Distribution=fix(total_Mission_Count.*ratio_Mission_Distribution);%����ռ��������ʵ�ʿ�ѡ������
for id_member=1:length(value_Mission_Distribution) %ȷ�����ٿ�ѡһ������
    if value_Mission_Distribution(id_member)<0.5
        value_Mission_Distribution(id_member)=1;
    end
end
mission_Distribution1=[mid_member_IDnum,mid_member_Lat_Lon,value_Mission_Distribution,mid_member_Mission_Begin_Time,mid_member_Credit];
mission_Distribution=sortrows(mission_Distribution1,[5 -4 -6]);%��ѡ��ʱ������ѡ������������ֵ��������
for id=10:length(mission_Distribution(:,1))     %��˳��ѡ������ֱ������������
    result_Mission_Distribution=mission_Distribution(1:id,:);
    if sum(result_Mission_Distribution(:,4))>total_Mission_Count
        break
    end
end
member_ID=result_Mission_Distribution(:,1);
member_Lat_Lon=[result_Mission_Distribution(:,2),result_Mission_Distribution(:,3)];
member_Mission_Limit=result_Mission_Distribution(:,4);
member_Mission_Begin_Time=result_Mission_Distribution(:,5);
member_Credit=result_Mission_Distribution(:,6);
savefilename=strcat(strcat(pathWriteMat,token1),'.mat');
save(savefilename,'full_member_Lat_Lon','full_member_Mission_Limit','full_member_Mission_Begin_Time','full_member_Credit','full_member_ID','member_Lat_Lon','member_Mission_Limit','member_Mission_Begin_Time','member_Credit','member_ID');

% figure
% scatter(full_member_Credit,full_member_Mission_Limit,[],full_member_Mission_Begin_Time)