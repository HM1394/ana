clear all
A=[1,1/5,3;5,1,5;1/3,1/5,1];
B1=[1,1/3;3,1];%C1,C2
B2=[1,1/5;5,1];%C2,C3
B3=[1,5;1/5,1];%C1,C4
%和法计算权向量
[wA,lambdaA,CIA,CRA]=summethod(A);%CRA=0.1198>0.1 需修正A
[wB1,lambdaB1,CIB1,CRB1]=summethod(B1);
[wB2,lambdaB2,CIB2,CRB2]=summethod(B2);
[wB3,lambdaB3,CIB3,CRB3]=summethod(B3);
WB1=[wB1;0;0];
WB2=[0;wB2;0];
WB3=[wB3(1,1);0;0;wB3(2,1)];
C=[WB1,WB2,WB3]*wA;