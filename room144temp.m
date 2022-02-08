% halli temperatuuri olekumudel
% Olekumuutujad e olekuvektor X=[Ts2 Tw2 Tw1 Ts1 Tf Th T1]'
% Ts2 - välisseina välispinna temp
% Tw2 - välisseina II sisekihi temp
% Tw1 - välisseina I sisekihi temp
% Ts1 - välisseina sisepinna temp
% Tf  - põranda sisetemp
% Th - küttekeha temp
% T1 - ruumiõhu temp
% Sisendmuutujad e sisendvektor U=[Toa Tg Fii_i Fii_heat Fii_sol Fii_r]
% Toa - välisõhu temp
% Tg - pinnase sisetemperatuur põranda all
% Fii_i - vabasoojuse soojusvool [W]
% Fii_heat - soojusvool küttekehas [W]
% Fii_sol - päikesekiirguse soojusvoog [W/m2] välisseinale
% Fii_r - päikesekiirguse soojusvool siseruumi [W]
%% Sisendmõjud
% 
dmdt = 1.194; % konvektori õhuvool [kg/s], 8kW
c_air = 1005; % õhu masserisoojus [J/kgK]
Fii_i1 = 132; % ühe inimese metaboolne panus [W] EnergyPlus paketis 
Fii_i = 5*Fii_i1; % 5 kohal nt kella 8-12 ja 13-18-ni
[C_B,C_A]=butter(6,0.0099); % aknaid läbiva päikesekiirguse ülekandefunktsioon
%% Mudeli parameetrid
% ruumi pindala 144 m2, ruumala 432 m3, seinte ja katuse pindala 264 m2,
% akende pindala 24 m2
C1 = 0.523e6; % ruumiõhu soojusmahtuvus [J/K]
Ch = 0.234e6; % küttekeha soojusmahtuvus
Rheater = 1/(dmdt*c_air); % küttekeha pinna soojustakistus
Rground = 20.152e-4; % põranda alumise poole soojustakistus [K/W]
Rf2 = Rground; % põranda ülemise poole soojustakistus [K/W]
Rf1 = 69.444e-4; % põranda pinna konvekt.soojustakistus (alfa=1)
Cf = 2.702e6; % põranda soojusmahtuvus [J/K]
R1 = 12.314e-4; % välisseina sisepinna konvekt.soojustakistus (alfa=3.08)
Cwi = 19.301e6; % välisseina sisepinna soojusmahtuvus
Rc1 = 8.656e-4; % välisseina sisemise kihi soojustakistus
Cw1 = 9.506e6; % välisseina I sisekihi soojusmahtuvus
Rc2 = 3.562e-4; % välisseina keskmise kihi soojustakistus
Cw2 = 8.629e6; % välisseina II sisekihi soojusmahtuvus
Rc3 = 3.146e-4; % välisseina välimise kihi soojustakistus
Cwo = 22.188e6; % välisseina välispinna soojusmahtuvus
Rext = 2.088e-4; % välisseina välispinna konvekt.soojustakistus (alfa=10.2)
Rw = 238e-04; % akende pinna soojustakistus(U=3.071W/m2K,SolarHeatGainCoef=0.258)
Rws = 0.02/(0.05*24); % akna välisvarjete soojustakistus
%% Kihtide paksus/soojuserijuhtivus [m]/[Wm/(m2K)]
A=264; % seinte pindala + samast materjalist katuslagi
Uw=1/(0.13 + 0.0254/0.690 + 0.1/0.73 + 0.019/0.726 +0.04); %[W/(m2K)]
UAw=Uw*A; % R=1/UAw %kogu pinna soojustakistus
%% Kihtide paksus*tihedus*masserijoojus*A = soojusmahtuvus
Cw=(0.0254*1858 + 0.1*1922 + 0.019*1602)*837*A;