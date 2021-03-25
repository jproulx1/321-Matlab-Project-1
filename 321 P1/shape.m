function [shapeu] = shape(T,Type,Harm)
TM=T-0.07;

slopea=1/(0.03*8192);
A=[0:slopea:1];
sloped=-0.4/(0.02*8192);

if Type==1
    D=ones(1,164);
    D=[1:sloped:0.6];
    L=(TM*8192);
LR=round(L,0);
S=0.6+zeros(1,LR);

sloper=-0.6/(0.02*8192);
R=[0.6:sloper:0];
shapeu=[A D S R]
elseif Type==2
nT=8192*(T-0.03);
t=[0:1:nT]
de=[exp(-(((Harm^2)+4)*t/nT))];
shapeu=[A de]
end
end

%shapeu=(Note.*shaped);




