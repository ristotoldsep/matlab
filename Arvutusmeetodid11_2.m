%leiame funktsiooni eksponentsiaalse lähendi
%sisestame tabeli andmed
x=[4,6,8,10];
y=[0.12,1.4,12,135];
kappa=[2,2,1,1];

%logaritmime y-väärtused
ylog=log(y);

%sisestame maatriksi A (võrduse vasakul poolel)
A(1,1)=sum(kappa);
A(1,2)=sum(kappa.*x);
A(2,1)=A(1,2);
A(2,2)=sum(kappa.*x.^2);

%sisestame maatriksi b 
b(1)=sum(kappa.*ylog);
b(2)=sum(kappa.*ylog.*x);

%lahendame maatriksvõrrandi
c=inv(A)*b';

%määrame eksponentfunktsiooni kordajad
alpha=exp(c(1));
beta=c(2);

%joonestame graafiku
xgraafik=4:1e-1:10;

%sisestame lähendi
ygraafik=alpha*exp(beta*xgraafik);

%joonestame graafiku
plot(xgraafik,ygraafik,x,y,'*')
grid on
xlabel('x')
ylabel('y')