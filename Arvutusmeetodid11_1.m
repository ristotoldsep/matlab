%leiame antud funktiooni ruutlähendi vähimruutude mõttes
%sisestame tabeli andmed
x=[-10,-5, 0, 5, 10];
y=[2.2, 4.4, 5.1, 4.1, 1.8];
kappa=[2,1,1,1,2]; %kaalud

%sisestame maatriksi elemendid ühe kaupa
%st A(1,1)=sum(kappa) jne
for i=1:3
    for j=1:3
        A(i,j)=sum(kappa.*x.^(i+j-2))
    end
    B(i)=sum(kappa.*y.*x.^(i-1))
end

%lahendame maatriksvõrrandi Ac=B, leiame kordajad c(i)
c=inv(A)*B';

%joonestame graafiku
xgraafik=-10:1e-1:10; %1e-1=0.1
ygraafik=pol(c,xgraafik);
plot(xgraafik,ygraafik,x,y,'*')
grid on
xlabel('x')
ylabel('y')
Phi=pol(c,x)
