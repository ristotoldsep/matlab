% Risto Tõldsep 185402IACB
% Ylesanne 3

% miinimumpunkti leidmine gradientmeetodiga
% sammu pikkuse vähendamisega (a)
% defineerime funktsiooni
f = @(x, y, z) (x + 1)^2 + (y - 4)^2 + (z + 5)^2 + x^4 + 2*y^4 + 3*z^4;
% määrame alglähendi
x=0;
y=0;
z=0;
% fiktiivne lahend
xvana=1;
yvana=2;
zvana=3;
% anname ette sammupikkuse algväärtuse,
% mida hakkame vähendama
t=1;
% vähendamistegur
t1 = 0.5;
% loendame sammud
loendur = 0;
% defineerime täpsuse
eta = 1e-4;
% koostame iteratsioonitsükli
while abs(x-xvana) + abs(y-yvana) + abs(z-zvana)>= eta
    % antigradient määrab ära suuna, milles funktsioon f kahaneb kõige
    % kiiremini
    v1 = -(2*(x+1)+4*x^3);
    v2 = -(2*(y-4)+8*y^3);
    v3 = -(2*(z+5)+12*z^3);
    xuus = x+t*v1;
    yuus = y+t*v2;
    zuus = z+t*v3;
    while f(xuus, yuus, zuus) >= f(x,y,z)
        % arvutame uue sammupikkuse kui ei ole täidetud funktsiooni
        % kahanemise tingimused
        % f(xuus,yuus)<(x,y)
        t=t*t1;
        xuus=x+t*v1;
        yuus=y+t*v2;
        zuus=z+t*v3;
    end
    xvana=x;
    yvana=y;
    zvana=z;
    x=xuus;
    y=yuus;
    z=zuus;
    loendur=loendur+1;
end
disp('Miinimumpunkt:')
x
y
z
sammud = loendur
disp('Miinimumväärtus:')
f(x,y,z)