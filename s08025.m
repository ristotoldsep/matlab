clear
f=@(x)x^4-3*x^2+x+1;
fplot(f, [-0.5,1.5])
grid on
f1=@(x)4*x^3-6*x+1;

%return
eta=1e-6;
x=-1.6;
x=-0.45;
x=1;
x=1.25;
xvana=1; %fiktiivne väärtus
while abs(x-xvana)>=eta
    xvana=x;
    x=x-f(x)/f1(x);
end
x
