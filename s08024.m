clear
f=@(x)sqrt(cos(x/5)+x^4)+x-8;
fplot(f, [-4,0])
grid on
c=0.1
%return
g=@(x)x+c*f(x);
eta=1e-6;
x=-3.3;
xvana=1; %fiktiivne väärtus
while abs(x-xvana)>=eta
    xvana=x;
    x=g(x);
end
x
