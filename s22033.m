clear
% sisestame tabeli punktid
x=[0,1,2,3];
y=[-1,2,1,5];
% interpolatsiooni polünoomi kordajad
c=[3/2,-13/2,8,-1];
% defineerime polünoomi, kasutame skripti pol.m
Phi=@(x)pol(c,x);
% joonestame graafiku
fplot(Phi, [-1,4])
hold on
% lisame graafikule tabeli punktid
plot(x,y,'*')
grid on
xlabel('x')
ylabel('y')
hold off