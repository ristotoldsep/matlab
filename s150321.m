% Miinimumpunkti leidmine koordinaatide järgi languse meetodiga
% Defineerime funktsiooni
f=@(x,y)exp(0.2*(x^2+y^2))+(x-1)^2+(y-2)^2;
% defineerime täpsuse
eta = 1e-4;
eta1 = 1e-5; % kuldlõike täpsus
% määrame alglahendi
x=0;
y=0;
% fiktiivne lähend
xvana=1;
yvana=1;
% muutuja siht vastab teljele, mille sihis liigume:
% a) siht = -1 kui liigume x-telje sihis
% b) siht = 1 kui liigume y-telje sihis (nii on lis kokkulepitud)
% defineerime algväärtuse 1
siht = 1; % alustame liigumist y-telje sihis
% minimeerimise põhitsükkel:
% igal tsükli sammu alguses muudame muutuja sihtmärki (garanteeritud
% liikumine vahelduvates suundades, st x-telg --> y-telg)
while max(abs(x-xvana), abs(y-yvana)) >= eta
    siht = -siht; % muudame sihi suunda
    % miinimumpunkti leiame kuldlõike meetodiga
    % valime alalõigu [-2;2]
    a=-2;
    b=2;
    c=b-2/(1+sqrt(5))*(b-a);
    d=a+2/(1+sqrt(5))*(b-a);
    if siht < 0
        fc=f(x+c,y);
        fd=f(x+d,y);
    else
        fc=f(x,y+c);
        fd=f(x,y+d);
    end
    while abs(b-a)>=eta1
        if  fc<fd
            b=d;
            d=c;
            c=b-2/(1+sqrt(5))*(b-a);
            fd=fc;
            if siht < 0
                fc=f(x+c,y); % nihutame x koordinaati
            else 
                fc=f(x, y+c); % nihutame y koordinaati
            end
        else
            a=c;
            c=d;
            d=a+2/(1+sqrt(5))*(b-a);
            fc=fd;
            if siht < 0
                fd=f(x+d,y);
            else 
                fd=f(x,y+d);
            end
        end
    end
    samm=(a+b)/2;
    if siht < 0
        xvana=x;
        x=x+samm;
    else
        yvana=y;
        y=y+samm;
    end
end
disp('lõpptulemus')
x
y