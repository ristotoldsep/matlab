%sisestame algandmed
t=0:0.4:3.6;
x=[3.1 3.8 4.9 6.5 8.4 9.9 11.0 11.5 11.7 11.8];

%lähendame funktsiooni x kuuppolünoomiga vähimruutude mõttes võrdsete
%kaaludega ja leiame selle polünoomi teise tuletise nullkoha
%sisestame kaalud
kappa = ones(1,10);

%sisestame maatriksid
for i=1:4
    for j=1:4
           A(i,j)=sum(kappa.*t.^(i+j-2));
    end
    B(i)=sum(kappa.*x.*t.^(i-1));
end

%lahendame süsteemi A*c=B
c=inv(A)*B';
%kiirenduse nullpunkt (teine tuletis on null)
t0=-c(3)/(3*c(4))
Phi=c(1)+c(2)*t0+c(3)*t0^2+c(4)*t0^3
%koostame kuuppolünoomi
%Phi = c(1)+c(2)*t+c(3)*t^2+c(4)*t^3;