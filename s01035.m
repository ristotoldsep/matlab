%joonestame funktsiooni - OTSIME ALGLÄHENDI eelmisele ülesandele
%visuaalselt graafiku abil
%f=@(x)x*sin(x)+0.1*(x-1)^2;
f=@(x)x*sin(x)+0.1*(x-1)^2;
fplot(f, [4,6])
grid on