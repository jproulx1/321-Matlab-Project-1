function [shapeu] = shape(T,Type)
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
    ZKO=[0:1/(16384-490):1];
    for n=1:length(ZKO)
        ZKO(n)=1*(1-n/(16384-490))^2;
    end
    shapeu=[A ZKO]
end
end

%shapeu=(Note.*shaped);




