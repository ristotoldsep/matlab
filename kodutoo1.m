%mudelisisestuse fail

nr=input('sisesta õpingukoodi viimane number =')
%parameetrid (selgitused vt täpsemalt Overhead_crane.pdf)

M=1000, m=700, L=(7+0.2*nr), g=9.8; D=777; %M = Käru mass, m = koorma mass, L = trossi pikkus, D = sumbuvustegur
%olekumuutujad:
% X1 - asend [m], X2 - nurk [rad], X3 - kiirus[m/s], X4 - nurkkiirus[rad/s]
X1s=(9.5-0.5*nr) %seadesuurus asendile
%piirangud:
MaxX1=10, MaxX2=0.2, Umax=2000 %10 = sammude arv mis lubatud liikuda kärul, 0.2 max trossi nurk radiaanides, sisendi jõu maksimum Njuutonites
% olekumudeli maatriksid

A=[ 0 0 1 0;  0 0 0 1;  0 m*g/M -D/M 0;  0 -(M+m)*g/(M*L) D/(M*L) 0]

B=[0; 0; 1/M; -1/(M*L)]

G=[0; 0; 0; -1/(m*L)] %horisontaalse tuule häiring
C=[1 L 0 0] % väljundiks tõstekoormuse asend trossi otsas, kodutöö 1-s pole vajalik


