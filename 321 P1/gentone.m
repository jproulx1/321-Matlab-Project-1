function [sound] = gentone(frequency,time,gain)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Fs=8192;
T=[0:1/8192:time];
sound=gain*sin(2*pi*frequency*T);

end