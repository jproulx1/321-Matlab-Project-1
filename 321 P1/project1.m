
%Fs=8192;
%T=[0:1/8192:0.97]
%freq=;
%y=sin(2*pi*freq*T);


eigth_rest=genrest(0.25);
eigth_g=gentone(392,0.25,1,1);
half_e=gentone(311.13,1,1,1);
eigth_f=gentone(349.23, 0.25,1,1);
half_d=gentone(293.66,1,1,1);

eigth_g2=gentone(392,0.25,1,0);
half_e2=gentone(311.13,1,1,0);
eigth_f2=gentone(349.23, 0.25,1,0);
half_d2=gentone(293.66,0.97,1,0);
%eigth_g_with_rest=gentone(392,0.25,1);
%eigth_rest=genrest(0.25);
%rest=genrest(0.03);
%soundsc(eigth_b);
figure(1)
subplot(4,1,1);
y=eigth_g;
x=[0:1/8192:.25];
plot(x,y)
title('Eighth G')
subplot(4,1,2);
y2=eigth_f;
plot(x,y2);
title('Eighth F')
subplot(4,1,3)
y3=half_e;
x2=[0:1/8192:1];
plot(x2,y3)
title('Half E')
subplot(4,1,4)
y4=half_d;
x2=[0:1/8192:1];
plot(x2,y4)
title('Half D')

figure(6)
subplot(4,1,1);
y=eigth_g2;
x=[0:1/8192:.22];
plot(y)
title('Eighth G')
subplot(4,1,2);
y2=eigth_f2;
plot(y2);
title('Eighth F')
subplot(4,1,3)
y3=half_e2;
x2=[0:1/8192:0.97];
plot(y3)
title('Half E')
subplot(4,1,4)
y4=half_d2;
x2=[0:1/8192:0.97];
plot(y4)
title('Half D')

melody=[eigth_rest eigth_g eigth_g eigth_g half_e eigth_rest eigth_f eigth_f eigth_f half_d]
%soundsc(melody);
figure(2)
spectrogram(melody,256,196, 512 , 8192,'yaxis')
%up to this point written by Joshua Proulx

T=0.25;
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
shapez=[A D S R]
figure(3)
y7=shapez;

plot(y7);


echo=zeros(1,2*8192);
echo(1)=1;
echo((length(echo)/4)+1)=0.5;
echo((length(echo)/2)+1)=0.25;
echo((length(echo)*(3/4))+1)=0.125;
echo((length(echo))+1)=.0625;


reverb=conv(melody,echo);
%soundsc(reverb);

%plotting reverb
figure(4)
Xreverb=linspace(0,4.25,length(reverb));
plot(Xreverb,reverb)
ylabel('Frequency(Hz)');
xlabel('Time(s)');
figure(5)
spectrogram(reverb,256,196,512,8192,'yaxis');


%generate 440hz with 9 harmonics
harmony1=harmonics(440,1,9,[1 1 1 1 1 1 1 1 1],1);
figure(9)
subplot(2,1,1)
spectrogram(harmony1,256,196, 512 , 8192,'yaxis')

harmony2=harmonics(440,1,10,[1 1 1 1 1 1 1 1 1 1],1);
subplot(2,1,2)
spectrogram(harmony2,256,196, 512 , 8192,'yaxis')
figure(10)
harmony3=harmonics(440,1,1,[1],1);
%soundsc(harmony3)
subplot(2,1,1)
xharm=harmony3(411:1886);
xharm2=[xharm xharm];
plot(xharm2)
subplot(2,1,2)
xharm3=harmony1(411:1886)
xharm4=[xharm3 xharm3]
plot(xharm4)