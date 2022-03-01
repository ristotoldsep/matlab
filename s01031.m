%leiame funktsiooni miinimumpunkti
%kuldlõike meetodiga, täpsus 10^-2
%defineerime funktsiooni
f=@(x)(cos(x))^2-x/2;
%määrame täpsuse
eta=1e-2;
%määrame otspunktid
a=1.5;
b=2.5;
% arvutame punkti c ja d kuldlõike meetodil...nii et c<d
c=b-2/(1+sqrt(5))*(b-a);
d=a+2/(1+sqrt(5))*(b-a);
% leiame funktsiooni väärtused punktides c ja d
fc=f(c);
fd=f(d);
% iteratsioonitsükkel
while abs(b-a)<=eta
    if fc<fd
        b=d;
        d=c;
        c=b-2/(1+sqrt(5))*(b-a);
        fd=fc;
        fc=f(c);
    else
        a=c;
        c=d;
        d=a+2/(1+sqrt(5))*(b-a);
        fc=fd;
        fd=f(d);
    end
end
%väljastame miinimumpunkti
x=(a+b)/2 % (tekkinud lõigu keskpunkt)
% arvutame funktsiooni minimaalse väärtuse
fmin=f(x)
        