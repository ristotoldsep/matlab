% leiame funktsiooni miinimumpunkti
% newtoni meetodiga
% defineerime funktsiooni
f=@(x)x*sin(x)+0.1*(x-1)^2;
%defineerime funktsiooni tuletised
ftuletis=@(x)sin(x)+x*cos(x)+0.2*(x-1);
ftuletis2=@(x)2*cos(x)-x*sin(x)+0.2;
% määrame alglähendi graafikult
x=5;
 %määrame fiktiivse lähendi, et teostada iteratsiooni esimest sammu
 xvana =-1;
% defineerime täpsuse
eta=1e-7;
%loeme sammud kokku
loendur=0;
while abs(x-xvana)>=eta
    xvana=x;
    x=x-ftuletis(x)/ftuletis2(x);
    loendur=loendur+1;
end
% väljastame tulemuse
disp('Lõpptulemus')
x
sammud=loendur
disp('Miinimumpunkt')
fmin=f(x)