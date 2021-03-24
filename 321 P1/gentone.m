function [sound] = gentone(frequency,time,gain,shapeq)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Fs=8192;


smallrest=genrest(0.03);
if shapeq==0
    T=[0:1/8192:time-0.03];
    sound1=gain*sin(2*pi*frequency*T);
    sound=[sound1 smallrest];
elseif shapeq==1 || shapeq==2
    T=[0:1/8192:time];
    sound1=gain*sin(2*pi*frequency*T);
    soundk=shape(time,shapeq);
    sound=(sound1.*soundk);
end