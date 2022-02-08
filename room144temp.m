% halli temperatuuri olekumudel
% Olekumuutujad e olekuvektor X=[Ts2 Tw2 Tw1 Ts1 Tf Th T1]'
% Ts2 - v�lisseina v�lispinna temp
% Tw2 - v�lisseina II sisekihi temp
% Tw1 - v�lisseina I sisekihi temp
% Ts1 - v�lisseina sisepinna temp
% Tf  - p�randa sisetemp
% Th - k�ttekeha temp
% T1 - ruumi�hu temp
% Sisendmuutujad e sisendvektor U=[Toa Tg Fii_i Fii_heat Fii_sol Fii_r]
% Toa - v�lis�hu temp
% Tg - pinnase sisetemperatuur p�randa all
% Fii_i - vabasoojuse soojusvool [W]
% Fii_heat - soojusvool k�ttekehas [W]
% Fii_sol - p�ikesekiirguse soojusvoog [W/m2] v�lisseinale
% Fii_r - p�ikesekiirguse soojusvool siseruumi [W]
%% Sisendm�jud
% 
dmdt = 1.194; % konvektori �huvool [kg/s], 8kW
c_air = 1005; % �hu masserisoojus [J/kgK]
Fii_i1 = 132; % �he inimese metaboolne panus [W] EnergyPlus paketis 
Fii_i = 5*Fii_i1; % 5 kohal nt kella 8-12 ja 13-18-ni
[C_B,C_A]=butter(6,0.0099); % aknaid l�biva p�ikesekiirguse �lekandefunktsioon
%% Mudeli parameetrid
% ruumi pindala 144 m2, ruumala 432 m3, seinte ja katuse pindala 264 m2,
% akende pindala 24 m2
C1 = 0.523e6; % ruumi�hu soojusmahtuvus [J/K]
Ch = 0.234e6; % k�ttekeha soojusmahtuvus
Rheater = 1/(dmdt*c_air); % k�ttekeha pinna soojustakistus
Rground = 20.152e-4; % p�randa alumise poole soojustakistus [K/W]
Rf2 = Rground; % p�randa �lemise poole soojustakistus [K/W]
Rf1 = 69.444e-4; % p�randa pinna konvekt.soojustakistus (alfa=1)
Cf = 2.702e6; % p�randa soojusmahtuvus [J/K]
R1 = 12.314e-4; % v�lisseina sisepinna konvekt.soojustakistus (alfa=3.08)
Cwi = 19.301e6; % v�lisseina sisepinna soojusmahtuvus
Rc1 = 8.656e-4; % v�lisseina sisemise kihi soojustakistus
Cw1 = 9.506e6; % v�lisseina I sisekihi soojusmahtuvus
Rc2 = 3.562e-4; % v�lisseina keskmise kihi soojustakistus
Cw2 = 8.629e6; % v�lisseina II sisekihi soojusmahtuvus
Rc3 = 3.146e-4; % v�lisseina v�limise kihi soojustakistus
Cwo = 22.188e6; % v�lisseina v�lispinna soojusmahtuvus
Rext = 2.088e-4; % v�lisseina v�lispinna konvekt.soojustakistus (alfa=10.2)
Rw = 238e-04; % akende pinna soojustakistus(U=3.071W/m2K,SolarHeatGainCoef=0.258)
Rws = 0.02/(0.05*24); % akna v�lisvarjete soojustakistus
%% Kihtide paksus/soojuserijuhtivus [m]/[Wm/(m2K)]
A=264; % seinte pindala + samast materjalist katuslagi
Uw=1/(0.13 + 0.0254/0.690 + 0.1/0.73 + 0.019/0.726 +0.04); %[W/(m2K)]
UAw=Uw*A; % R=1/UAw %kogu pinna soojustakistus
%% Kihtide paksus*tihedus*masserijoojus*A = soojusmahtuvus
Cw=(0.0254*1858 + 0.1*1922 + 0.019*1602)*837*A;