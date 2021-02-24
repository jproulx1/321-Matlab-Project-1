function [shapeu] = shape(T,Note)
TM=T-0.07;

slopea=1/(0.03*8192);
A=[0:slopea:1];

sloped=-0.4/(0.02*8192);
D=[1:sloped:0.6];
L=(TM*8192);
LR=round(L,0);
S=0.6+zeros(1,LR);

sloper=-0.6/(0.02*8192);
R=[0.6:sloper:0];
shaped=[A D S R]
shapeu=(Note.*shaped);




