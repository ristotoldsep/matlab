% kaalumaatriksid optimaalsele sünteesile
q11=1.05/(X1s^2) % kaalutegur x1-le (x1 on asend - tema maksimum 10m, kui selle järgi valida, peaks võtma suuremaks/võrdeks 1/10^2), 1 puhul läks reguleerimisaeg natuke üle piiri, tõstsin seda 1-lt 2-le, siire läks palju aeglasemaks, aga diskreetne juhttoime oli suhteliselt sama, reguleerimisaeg läks väiksemaks! Parim variant 1.05
q22=1/(0.2^2) % kaalutegur x2-le (x2 on nurk)
q33=0.01;  % algselt võib joonkiiruse kaaluteguri võtta nulliks, sest pole piiratud (1/1^2 = 1 oli liiga suur, tegi siirde aeglaseks, muutsin et piirata ülereguleerimist, mida väiksem seda kiirem)
q44=0; % ka nurkkiirusele pole piiranguid seatud, algselt võib võtta nulli
Q=diag([q11 q22 q33 q44]), % Anname ette juhtimiskriteeriumi, diagonaalmaatriks q
R=1/(Umax^2) % Seos / R11 maatriks
K=lqr(A,B,Q,R) % olekuregulaatori optimaalne süntees

%suletud süsteemi omaväärtuste paigutus
% eig(A-b*K)
%optimaalsüsteem tekitab pigem võnkuvate omadustega siirdeid...

% suletud süsteemi / olekuregulaatori pidevajasüntees 
ksii = 0.73 % väikese ülereguleerimisega sumbuvus, et oleks kiirem (mida lähemal ksii 1-le, seda vähem võngub, 0.7 = üks väike ülevõnge
wn = 3/(ksii*5.55) % wn arvutatud... viimane nr = sekundid, oomega n arvutatud oodatava siirdeaja järgi / (siirdeaeg/reguleerimiseaeg)
P = roots ([1 2*ksii*wn wn^2]) %prototüüpülekandefunktsiooni nimetajast võtame välja kaks omaväärtust, mida suletud süsteemis kasutada (Polünoomi poolused) 
 %2 maatriksit, suletud süsteemi pooluste paigutus, nihutame 10%
K = place(A, B, [P; -wn; -wn*1.2]) % modaalne süntees pidevajas / omaväärtused (2 ülejäänud omaväärtust) 

% disktreetaja olekumudeli arvutamine/moodustamine pidevajast
td=0.2 % diskreetimistakt
[Ad,Bd]=c2d(A,B,td)  %käsk = continuous to discrete
[Ad,Gd]=c2d(A,G,td)

Kd=dlqr(Ad,Bd,Q,R) % olekuregulaatori optimaalne süntees diskreetajas

%Pidev juhttoime oli nii piirides, võin seda tõsta, peaasi et diskreetaja
%toime oleks 2000N piirides, selleks peab muutma kaalutegurit,
%kui tahan et juhtoime oleks ksuurem, peab kaalutegur olema vaiksem ehk piiratakse vähem maha
 
% olekuregulaatori süntees diskreetajas
Z = exp([P; -wn; -wn*1.2]*td) % Omaväärtused diskreetajas
Kd=place(Ad, Bd, Z) % modaalne süntees diskreetajas 

% Diskreetne süntees Järgivsüsteemi osaga
% laiendatud olekumudeli maatriksite A2d, B2d moodustamine:
A2d=[Ad zeros(4,1); -C*Ad eye(1)]; %1 = ridu sama palju kui lisatud integraalset tagasisidet, ehk 1 rida nelja 0-ga
B2d=[Bd; -C*Bd];
rank(ctrb(A2d,B2d)) % juhitavuse maatriksi astak

q55 = 0.07; % integraalse tagasisidemuutuja/väljundmuutuja (trossi alumise otsa asend) integraalse vea kaalutegur | Annab kindlasti stabiilse süsteemi, sest kui valime ta positiivselt poolmääratuna, siis saame süsteemi stabiliseeriva tagasiside  
Q2d=diag([10*q11 q22 q33 q44 q55*td*td]), % td ruudus, sest kui tahaks tuua pidevajast diskreetaega üle, kaalutegur suuremaks, et sunniks olekumuutujat kiiremini paika minema, sellga tõmbab maha integraalse tagasiside poolt soodustatud ülereguleerimist
%R2d=1/(U1max^2) %Sisend kaalutegurina ei muutu, ehk pole vaja tähistada
K2d=dlqr(A2d,B2d,Q2d,R) % olekuregulaatori optimaalne süntees
