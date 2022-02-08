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
 
% olekuregulaatori süntees diskreetajas
Z = exp([P; -wn; -wn*1.2]*td) % Omaväärtused diskreetajas
Kd=place(Ad, Bd, Z) % modaalne süntees diskreetajas 

