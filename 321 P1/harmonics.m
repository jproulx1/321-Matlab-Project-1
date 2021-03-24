function [harmonicnote] = harmonics(Frequency,Duration,N,A_vect,Shape)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
harmonicpart=[0:1/8192:Duration];
for n=1:N
  harmonicpart = harmonicpart + gentone(Frequency*n,Duration,A_vect(n),1);
end

if Shape==0
harmonicnote=harmonicpart;
elseif Shape==1
    harmonicnotek=shape(harmonicpart);
    harmonicnote=(harmonicpart .* harmonicnotek);
end