% miinimumpunkti leidmine gradientmeetodiga
% sammu pikkuse vähendamisega (a)
% defineerime funktsiooni
f=@(x1,x2,x3)(x1+3)^4+(x2-2)^2+(x3+1)^2+x1^2+x2^2+x3^2;
% määrame alglähendi
x1=0;
x2=0;
x3=0;
% fiktiivne lahend
x1vana=1;
x2vana=2;
x3vana=3;
% anname ette sammupikkuse algväärtuse,
% mida hakkame vähendama
t=1;
% vähendamistegur
t1 = 0.5;
% loendame sammud
loendur = 0;
% defineerime täpsuse
eta = 1e-3;
% koostame iteratsioonitsükli
while sqrt((x1-x1vana)^2+(x2-x2vana)^2+(x3-x3vana)^2)>= eta
    % antigradient määrab ära suuna, milles funktsioon f kahaneb kõige
    % kiiremini
    v1 = -(4*(x1+3)^3+2*x1);
    v2 = -(2*(x2-2)+2*x2);
    v3 = -(2*(x3+1)+2*x3);
    x1uus = x1+t*v1;
    x2uus = x2+t*v2;
    x3uus = x3+t*v3;
    while f(x1uus, x2uus, x3uus) >= f(x1,x2,x3)
        % arvutame uue sammupikkuse kui ei ole täidetud funktsiooni
        % kahanemise tingimused
        % f(xuus,yuus)<(x,y)
        t=t*t1;
        x1uus=x1+t*v1;
        x2uus=x2+t*v2;
        x3uus=x3+t*v3;
    end
    x1vana=x1;
    x2vana=x2;
    x3vana=x3;
    x1=x1uus;
    x2=x2uus;
    x3=x3uus;
    loendur=loendur+1;
end
disp('Lõpptulemus')
x1
x2
x3
sammud = loendur