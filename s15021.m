clear
f=@(x)abs(x^4-16)-23;
%fplot(f, [-3,3])
%grid on
%return

eta=1e-5;
x=2.5;
%x=7.4;

xvana=1; %fiktiivne väärtus
while abs(x-xvana)>=eta
    xuus=x-f(x)*(x-xvana)/(f(x)-f(xvana));
    xvana=x;
    x=xuus;
end
x

