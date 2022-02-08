clear
f=@(x)x^4-10*x^3+x^2+7*x-2;
fplot(f, [-2,2])
grid on
f1=@(x)4*x^3-30*x^2+2*x+7;

%return
eta=1e-6;
x=-0.9;
%x=-0.32;
%x=0.74;
%x=9.7;
xvana=1; %fiktiivne väärtus
while abs(x-xvana)>=eta
    xvana=x;
    x=x-f(x)/f1(x);
end
x
