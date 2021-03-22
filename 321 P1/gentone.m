function [sound] = gentone(frequency,time,gain,shapeq)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Fs=8192;
T=[0:1/8192:time];
sound1=gain*sin(2*pi*frequency*T);
smallrest=genrest(0.03);
if shapeq==0

    sound=[sound1 smallrest];
elseif shapeq==1
    soundk=shape(time);
    sound=(sound1.*soundk);
end