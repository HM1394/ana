function [culResult_condProb,g]=condProb(anRelat_Mid,count)
%以anRelat_Mid(:,IC)因素从大到小，每大于count个任务1组，计算每组的成功概率及各相关因素的中位值，记入culResult_condProb；g记录每组成功次数及任务次数。
IC=length(anRelat_Mid(1,:));
anRelat_Mid_C=anRelat_Mid(:,IC);
anFreq_Mid=tabulate(anRelat_Mid_C);
group_Num=0;
ID=1;
for i=length(anFreq_Mid(:,1)):-1:1;
   group_Num=group_Num+anFreq_Mid(i,2);
   if group_Num>=count
     anGroup_Mid(ID,1)=anFreq_Mid(i,1); 
      ID=ID+1;
      group_Num=0;
   end
end
anGroup_Mid=[max(anRelat_Mid_C);anGroup_Mid;0];
for ii=length(anGroup_Mid(:,1))-1:-1:1
    log_culRelat_Mid=(anRelat_Mid_C<anGroup_Mid(ii,1)) & (anRelat_Mid_C>=anGroup_Mid(ii+1,1));
    culRelat_Mid=anRelat_Mid(log_culRelat_Mid,:);
    culResult_condProb(ii,1)=sum(culRelat_Mid(:,1))/length(culRelat_Mid(:,1));
    for j=IC:-1:2
        culResult_condProb(ii,j)=median(culRelat_Mid(:,j));
    end 
    g(ii,1)=sum(culRelat_Mid(:,1));
    g(ii,2)=length(culRelat_Mid(:,1));
 end
