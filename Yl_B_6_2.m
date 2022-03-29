% miinimumpunkti leidmine koordinaatide 
% j2rgi languse meetodiga
% defineerime antud funktsiooni
f=@(x,y)(x-3).^2+(y-1).^2+exp(x.^2+y.^2);
% defineerin t2psuse
eps=1e-3;
eps2=1e-4; % kuldl6ike meetodi t2psus
% m22ran algl2hendi ja fiktiivse eelimise l2hendi
x=0;
y=0;
xvana=1;
yvana=1;
% muutuja siht vastab teljele, mille sihis liigume:
% a) siht= -1, kui liigume x-telje sihis;
% b) siht= 1, kui liigume y-telje sihis
% algv22rtus on 1
siht=1;
loendur=0;
% minimineerimise p6hitsykkel:
% igal tsykli sammu alguses muudetakse muutuja siht m2rki
% see garanteerib liikumise vahelduvate suundades
while max(abs(x-xvana),abs(y-yvana))>=eps
    siht=-siht;
    % miinimumi leidmiseks antud sihis kasutame kuldl6ike 
    % meetodit algl6iguga [-10,10]
    a=-10;
    b=10;
    c=b-2/(1+sqrt(5))*(b-a);
    d=a+2/(1+sqrt(5))*(b-a);
    if siht<0
        fc=f(x+c,y);
        fd=f(x+d,y);
    else
        fc=f(x,y+c);
        fd=f(x,y+d);
    end
    while abs(b-a)>=eps2
        if fc<fd
        b=d;
        d=c;
        c=b-2/(1+sqrt(5))*(b-a);
        fd=fc;
        if siht<0
            fc=f(x+c,y);
        else
            fc=f(x,y+c);
        end
        else 
        a=c;
        c=d;
        d=a+2/(1+sqrt(5))*(b-a);
        fc=fd;
        if siht<0
            fd=f(x+d,y);
        else
            fd=f(x,y+d);
        end
        end
    end
    samm=(a+b)/2;
    if siht<0
        xvana=x;
        x=x+samm;
    else
        yvana=y;
        y=y+samm;
    end
    loendur=loendur+1;
end
sammud=loendur
disp('l6pptulemus')
x
y

        
          
        