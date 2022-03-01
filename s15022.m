%Õpikust lk 27 ül 2.8 vooluahel
clear
%andmed
%u1 + u2 = E
%u2 = r2*i
%u1 = (10+30i^3/2)*i
%(10+30i^3/2)*i + r2*i - E = 0
E=25; %V
r2=15; %Ohm

f=@(i)(10+30*i^(3/2))*i+r2*i - E;
%fplot(f, [-0,1])
%grid on
%return

x=0.6;
eta=1e-5;



xvana=1; %fiktiivne väärtus
while abs(x-xvana)>=eta
    xuus=x-f(x)*(x-xvana)/(f(x)-f(xvana));
    xvana=x;
    x=xuus;
end
disp('Voolutugevus:')
i=x


