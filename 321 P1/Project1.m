%Fs=8192;
%T=[0:1/8192:0.97]
%freq=;
%y=sin(2*pi*freq*T);


eigth_rest=genrest(0.25);
eigth_g=gentone(392,0.22,1);
half_e=gentone(311.13,0.97,1);
eigth_f=gentone(349.23, 0.22,1);
half_d=gentone(293.66,0.97,1);
smallrest=genrest(0.03);
%eigth_rest=genrest(0.25);
%rest=genrest(0.03);
%soundsc(eigth_b);
figure(1)
subplot(4,1,1);
y=eigth_g;
x=[0:1/8192:.22];
plot(x,y)
title('Eighth G')
xlabel('Time(s)')
ylabel('Amplitude')

subplot(4,1,2);
y2=eigth_f;
plot(x,y2);
title('Eighth F')
xlabel('Time(s)')
ylabel('Amplitude')

subplot(4,1,3)
y3=half_e;
x2=[0:1/8192:0.97];
plot(x2,y3)
title('Half E')
xlabel('Time(s)')
ylabel('Amplitude')

subplot(4,1,4)
y4=half_d;
x2=[0:1/8192:0.97];
plot(x2,y4)
title('Half D')
xlabel('Time(s)')
ylabel('Amplitude')

melody=[eigth_rest smallrest eigth_g smallrest eigth_g smallrest eigth_g smallrest half_e smallrest eigth_rest eigth_f smallrest eigth_f smallrest eigth_f smallrest half_d]
%soundsc(melody);
figure(2)
spectrogram(melody,256,196, 512 , 8192,'yaxis')
%up to this point written by Joshua Proulx





%knguyen

A = 0.03;
D = 0.02;
R = 0.02;
melody=[eigth_rest smallrest eigth_g smallrest eigth_g smallrest eigth_g smallrest half_e smallrest eigth_rest eigth_f smallrest eigth_f smallrest eigth_f smallrest half_d]
songtrack = [];
notes = [];
%size(song,1)
for i = 1: size(song,1)
    notes = gentone(song(i,1), song(i,2), frequency);
    plot(notes);
    xlim([0 50]);
    songtrack = [songtrack notes];
end
soundsc(songtrack, frequency)
%spectrogram(songtrack,256,196,512, frequency, 'yaxis')


%%PT4

echo=zeros(1,2*samp_f);
echo(1)=1;
echo((length(echo)/4)+1)=0.5;
echo((length(echo)/2)+1)=0.25;
echo((length(echo)*(3/4))+1)=0.125;
echo((length(echo))+1)=.0625;

%task2
reverb=conv(melody2,echo);
soundsc(reverb);

%plotting reverb
figure(6)
Xreverb=linspace(0,4.25,length(reverb));
plot(Xreverb,reverb)
ylabel('Frequency(Hz)');
xlabel('Time(s)');
figure(7)
spectrogram(reverb,256,196,512,8192,'yaxis');






