%Leiame funktsiooni tuletied, sisestame sõlmed ja funktsiooni väärtused
x = 1:0.1:1.9;
y = [22.0 23.1 23.4 24.1 24.9 25.4 25.6 25.4 24.8 24.1]
n = 10;

%sammu pikkus
h=0.1;

%esimese tuletis punktis x=1
%kasutame mittesümmeetrilist diferentsvalemit
y1(1)=(4*y(2)-y(3)-3*y(1))/(2*h);

%teine tuletis punktis x=1
%kasutame mitte sümmeetrilist diferentsvalemit
y2(1)=(2*y(1)-5*y(2)+4*y(3)-y(4))/(h^2);

%arvutame tuletised tabeli sisesõlmedes 
for i=2:n-1
    %leiame esimese tuletise, kasutame sümmeetrilisi diferentsvalemeid
    y1(i)=(y(i+1)-y(i-1))/(2*h);
    
    %leiame teise tuletise , kasutame sümmeetrilisi diferentsvalemeid
    y2(i)=(y(i+1)+y(i-1)-2*y(i))/(h^2);
end

%leiame tuletise tabeli viimases punktis
y1(n)=(3*y(n)-4*y(n-1)+y(n-2))/(2*h);

%leiame teise tuletise tabeli viimases punktis
y2(n)=(2*y(n)-5*y(n-1)+4*y(n-2)-y(n-3))/(h^2);

%väljastame tabeli
disp('tabel')
x
y
disp('esimene tuletis')
y1
disp('teine tuletis')
y2