clear
g=@(x)x^3+3*x^2-15;
fplot(@(x)x-g(x), [-5,5])
grid on
eta=1e-7;
x=0.4;
xvana=1; %fiktiivne väärtus
while abs(x-xvana)/abs(x)>=eta
    xvana=x;
    x=g(x);
end
x
