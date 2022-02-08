clear
f=@(x)x*cos(x)-3;
fplot(f, [4,8])
grid on
%return

eta=1e-3;
%x=5.35;
x=7.4;

xvana=1; %fiktiivne väärtus
while abs(x-xvana)>=eta
    xuus=x-f(x)*(x-xvana)/(f(x)-f(xvana));
    xvana=x;
    x=xuus;
end
x

