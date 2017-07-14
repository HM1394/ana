%���������ı���۸�,��Χ�����ܼ۸������ܼ��ȣ���Ա�ܼ��ȣ���Ա��������������������ϵ
clear all
pathWriteMat='E:\ana\mat\';%��¼���������ļ�·��
%%
token='m1';                                                 %��ȡ�ѽ�����Ŀ���������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'compl_Mission_lat_lon','compl_Mission_price','compl_Mission','compl_Mission_ID');
%%
token='anyCount_MemData';                                     %��ȡ������Ϊ���ģ����������һ����������Ч��Ա��ͳ�������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'anyCount_Member_MisSum','anyCount_Member_DisMean','anyCount_Member_DisStd','anyCount_Member_CreMean','anyCount_Member_CreStd');
%%
token='anyCount_MisData';                                     %��ȡ������Ϊ���ģ����������һ�������������ͳ�������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'anyCount_Mission_DisMean','anyCount_Mission_DisStd','anyCount_Mission_PriMean','anyCount_Mission_PriStd');
%%
token='anyDis_MemData';                                     %��ȡ�������һ���뾶��Χ�ڻ�Ա���������ͳ�������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'anyDis_Member_Count','anyDis_Member_DisMean','anyDis_Member_DisSum',...
    'anyDis_Member_DisStd','anyDis_Member_CreMean','anyDis_Member_CreSum',...
    'anyDis_Member_CreStd','anyDis_Member_MisSum',...
    'anyDis_Mission_Count','anyDis_Mission_DisMean','anyDis_Mission_DisSum',...
    'anyDis_Mission_DisStd','anyDis_Mission_PriMean','anyDis_Mission_PriSum',...
    'anyDis_Mission_PriStd');
%%
token='kernel_missio_distance';                                     %��ȡ�����������������ľ�������ļ�
loadfilename=strcat(strcat(pathWriteMat,token),'.mat');
load(loadfilename,'kernel_mission_Distance','idx_mission','ctrs_mission');
%%
token='kernel_member_distance';                                     %��ȡ��Ա�����������Ա�ľ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
load(savefilename,'kernel_member_Distance','idx_member','ctrs_member');
for id=1:length(ctrs_member(:,1))                 %����ÿ����������Ա���ĵľ���
    memberKernel_mission_Distance(:,id)=deg2km(distance(ctrs_member(id,1),ctrs_member(id,2),compl_Mission_lat_lon(:,1),compl_Mission_lat_lon(:,2)));    
end
%%
standData=@(input) input./repmat(nanstd(input),length(input(:,1)),1);   %���ݱ�׼������
stCompl_Mission_Price=compl_Mission_price./std(compl_Mission_price);    %����۸�
%��������������Ա����ͳ�����ݱ�׼��
stCount_Member_MisSum=standData(anyCount_Member_MisSum);                %����Ա������������ 1
stCount_Member_DisMean=standData(anyCount_Member_DisMean);              %����Ա���Ļ�Աƽ������
stCount_Member_DisStd=standData(anyCount_Member_DisStd);
stCount_Member_CreMean=standData(anyCount_Member_CreMean);              %����Ա����ƽ������ֵ 2
stCount_Member_CreStd=standData(anyCount_Member_CreStd);
stCount_Mission_DisMean=standData(anyCount_Mission_DisMean);            %��������������ƽ������
stCount_Mission_DisStd=standData(anyCount_Mission_DisStd); 
stCount_Mission_PriMean=standData(anyCount_Mission_PriMean);            %��������������ƽ���۸�
stCount_Mission_PriStd=standData(anyCount_Mission_PriStd);
%�������ͳ�����ݱ�׼��
stDis_Member_Count=standData(anyDis_Member_Count);                      %������Ļ�Ա���� 3
stDis_Member_CreSum=standData(anyDis_Member_CreSum);                  %������Ļ�Ա����ֵ�ܺ� 4
stDis_Member_CreMean=standData(anyDis_Member_CreMean); 
stDis_Member_CreStd=standData(anyDis_Member_CreStd);
stDis_Member_DisSum=standData(anyDis_Member_DisSum);                  %������Ļ�Ա�����ܺ�
stDis_Member_DisMean=standData(anyDis_Member_DisMean);
stDis_Member_DisStd=standData(anyDis_Member_DisStd);
stDis_Member_MisSum=standData(anyDis_Member_MisSum);                    %������Ļ�Ա��ӵ�е���������
stDis_Mission_Count=standData(anyDis_Mission_Count);                    %���������������
stDis_Mission_PriSum=standData(anyDis_Mission_PriSum);                 %�����������۸��ܺ�
stDis_Mission_PriMean=standData(anyDis_Mission_PriMean);
stDis_Mission_PriStd=standData(anyDis_Mission_PriStd);  
stDis_Mission_DisSum=standData(anyDis_Mission_DisSum);                %���������������ܺ�
stDis_Mission_DisMean=standData(anyDis_Mission_DisMean);
stDis_Mission_DisStd=standData(anyDis_Mission_DisStd); 
%����������ľ��������
stKer_Mission_Distance=standData(kernel_mission_Distance); 
%��Ա��������������С����
stMemberKer_Mission_Distance=standData(min(memberKernel_mission_Distance,[],2)); 
%��Ա�����Ա���ĵľ���
stKer_Member_Distance=standData(kernel_member_Distance); 
%%
token='stand_Data';                                     %��ȡ��Ա�����������Ա�ľ�������ļ�
savefilename=strcat(strcat(pathWriteMat,token),'.mat');
save(savefilename,'stCompl_Mission_Price','stCount_Member_MisSum','stCount_Member_DisMean','stCount_Member_DisStd',...
	'stCount_Member_CreMean','stCount_Member_CreStd','stCount_Mission_DisMean','stCount_Mission_DisStd',...
	'stCount_Mission_PriMean','stCount_Mission_PriStd','stDis_Member_Count','stDis_Member_CreSum','stDis_Member_CreMean','stDis_Member_CreStd',...
	'stDis_Member_DisSum','stDis_Member_DisMean','stDis_Member_DisStd','stDis_Member_MisSum','stDis_Mission_Count',...
	'stDis_Mission_PriSum','stDis_Mission_PriMean','stDis_Mission_PriStd','stDis_Mission_DisSum','stDis_Mission_DisMean','stDis_Mission_DisStd',...
	'stKer_Mission_Distance','stMemberKer_Mission_Distance','stKer_Member_Distance');

