function [prob_y,prob_YValue,b,dev,stats]=logit_ansys(x_data,y_data)
log_NaN=sum(isnan(x_data),2)>0;%去除NaN,防止计算出错
x=x_data(~log_NaN,:);
prime_y=y_data(~log_NaN,:);
sp = nominal(prime_y);
y = double(sp);
[b,dev,stats] = mnrfit(x,y);
yfit=mnrval(b, x,stats);
ty=(yfit(:,2)>0.5);
eval_y=(yfit(:,2)>0.5);
eval_y11=sum(eval_y(prime_y>0,:)==1);
eval_y22=sum(eval_y(~prime_y>0,:)==0);
eval_y12=sum(eval_y(prime_y>0,:)==0);
eval_y21=sum(eval_y(~prime_y>0,:)==1);
prob_y=[eval_y11./(eval_y11+eval_y12),eval_y12./(eval_y11+eval_y12);eval_y21./(eval_y21+eval_y22),eval_y22./(eval_y21+eval_y22)];%拟合正确率
prob_YValue=(eval_y11+eval_y22)./(eval_y11+eval_y12+eval_y21+eval_y22);