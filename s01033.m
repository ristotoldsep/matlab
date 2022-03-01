% leiame funktsiooni miinimumpunkti
% kuldlõike meetodiga
% defineerime funktsiooni
f=@(t)sin(t^4+t)+t^2-3*t-4;
% määrame täpsuse
eta=1e-5;
% määrame lõigu otspunktid
a=1.3;
b=1.4;
% arvutame punktid c ja d nii, et c<d
c=b-2/(1+sqrt(5))*(b-a);
d=a+2/(1+sqrt(5))*(b-a);
% arvutame funktsiooni väärtused punktides c ja d
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
% väljastame miinimumpunkti
t=(a+b)/2
% arvutame funktsiooni minimaalse väärtuse
fmin=f(t)



        