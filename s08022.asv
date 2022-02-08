clear
g=@(x)log(5-x);
fplot(@(x)x-g(x), [-2,4])
grid on
eta=1e-5;
x=1.3;
xvana=1; %fiktiivne väärtus
while abs(x-xvana)>=eta
    xvana=x;
    x=g(x);
end
x
