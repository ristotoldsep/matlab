clear
g=@(x)sin(x)+6;
fplot(@(x)x-g(x), [3,10])
grid on
eta=1e-4;
x=0;
xvana=1; %fiktiivne
while abs(x-xvana)/abs(x)>=eta
    xvana=x;
    x=g(x);
end
x