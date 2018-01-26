clc
clear all 
close all 


K=1.4;
R=8.314;
cp=(R*K)/(K-1);

M=100;

T1(1)=300;
T2(1)=340;
T3(1)=900;
T4(1)=410;

S1(1)=30;
S2(1)=30;
S3(1)=100;
S4(1)=100;


deltaS1=(S2(1)-S1(1))/M;
S1(1)=30;
for i=1:M-1;
    S1(i+1)=S1(i)+deltaS1;
end
deltaS2=(S3(1)-S2(1))/M;
S2(1)=30;
for i=1:M-1;
    S2(i+1)=S2(i)+deltaS2;
end
S3(1)=100;
deltaS3=(S4(1)-S3(1))/M;
for i=1:M-1;
    S3(i+1)=S3(i)-deltaS3;
end
S4(1)=100;
deltaS4=(S1(1)-S4(1))/M;
for i=1:M-1;
    S4(i+1)=S4(i)+deltaS4;
end

deltaT1=(T2(1)-T1(1))/M;
for i=1:M-1;
    T1(i+1)=T1(i)+deltaT1;
end
deltaT2=(T3(1)-T2(1))/M;
for i=1:M-1;
    T2(i+1)=T2(i)+deltaT2;
end
deltaT3=(T4(1)-T3(1))/M;
for i=1:M-1;
    T3(i+1)=T3(i)+deltaT3;
end
deltaT4=(T1(1)-T4(1))/M;
for i=1:M-1;
    T4(i+1)=T4(i)+deltaT4;
end

P1(1)=1;
P2(1)=16;
P3(1)=16;
P4(1)=1;

deltaP1=(P2(1)-P1(1))/M;
for i=1:M-1;
    P1(i+1)=P1(i)+deltaP1;
end
deltaP2=(P3(1)-P2(1))/M;
for i=1:M-1;
    P2(i+1)=P2(i)+deltaP2;
end
deltaP3=(P4(1)-P3(1))/M;
for i=1:M-1;
    P3(i+1)=P3(i)-deltaP3;
end
deltaP4=(P1(1)-P4(1))/M;
for i=1:M-1;
    P4(i+1)=P4(i)-deltaP4;
end

V1(1)=(R*T1(1))/P1(1);
V2(1)=(R*T2(1))/P2(1);
V3(1)=(R*T3(1))/P3(1);
V4(1)=(R*T4(1))/P4(1);

deltaV1=(V2(1)-V1(1))/M;
for i=1:M-1;
    V1(i+1)=(R*T1(i+1))/P1(i+1);
end
deltaV2=(V3(1)-V2(1))/M;
for i=1:M-1;
    V2(i+1)=(R*T2(i+1))/P2(i+1);
end
deltaV3=(V4(1)-V3(1))/M;
for i=1:M-1;
    V3(i+1)=(R*T3(i+1))/P3(i+1);
end
deltaV4=(V1(1)-V4(1))/M;
for i=1:M-1;
    V4(i+1)=(R*T4(i+1))/P4(i+1);
end

plot(S1(1),T1(1),'*');
hold on;
plot(S2(1),T2(1),'*');
hold on;
plot(S3(1),T3(1),'*');
hold on;
plot(S4(1),T4(1),'*');
hold on
plot(S1(1:M),T1(1:M),'r-');
hold on
plot(S2(1:M),T2(1:M),'r-');
hold on
plot(S3(1:M),T3(1:M),'r-');
hold on
plot(S4(1:M),T4(1:M),'r-');
grid on


xlabel('S (KJ/Kgk)')
ylabel('T (K)')
set(gca,'XLim',[(S1(1)-10) (S2(1)+100)],'YLim',[0 (T4(1)+600)])
title('Brayton Cycle')
Efficiency=1-T1(1)/T2(1)
Efficiency1=1-(P1(1)/P2(1))^((K-1)/(K))

%my comment
% yet another comment
