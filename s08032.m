% miinimumpunkti leidmine gradientmeetodiga
% sammu pikkuse vähendamisega (a)
% defineerime funktsiooni
f=@(x,y)atan(x^2+y^2)+(x-1)^2+(y-2)^2;
% määrame alglähendi
x=0;
y=0;
% fiktiivne lahend
xvana=1;
yvana=2;
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
while sqrt((x-xvana)^2+(y-yvana)^2)>= eta
    % antigradient määrab ära suuna, milles funktsioon f kahaneb kõige
    % kiiremini
    v1 = -(2*x)/(1+(x^2+y^2)^2)-2*(x-1);
    v2 = -(2*y)/(1+(x^2+y^2)^2)-2*(y-2);
    xuus = x+t*v1;
    yuus = y+t*v2;
    while f(xuus, yuus) >= f(x,y)
        % arvutame uue sammupikkuse kui ei ole täidetud funktsiooni
        % kahanemise tingimused
        % f(xuus,yuus)<(x,y)
        t=t*t1;
        xuus=x+t*t1;
        yuus=y+t*v2;
    end
    xvana=x;
    yvana=y;
    x=xuus;
    y=yuus;
    loendur=loendur+1;
end
disp('Lõpptulemus')
x
y
sammud = loendur      