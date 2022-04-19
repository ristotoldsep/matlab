%Leiame funktsiooni tuletied, sisestame sõlmed ja funktsiooni väärtused
x=3:0.1:3.6;
y=[5.25 5.32 5.41 5.37 5.31 5.25 5.16]

%sammu pikkus
h=0.1

%leiame tuletise diferentsvalemiga sammuga ette 
for i=1:6
    tuletis(i)= (y(i+1)-y(i))/h;
end

%leiame tuletise diferentsvalemiga sammuga taha
tuletis(7)=(y(7)-y(6))/h;

%väljastame tabeli
disp('tabel')
x
y
disp('tuletised')
tuletis