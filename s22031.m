% funktsiooni miinimumpunkti leidmine
% trahvifunktsioonide abil
% joonestame nivoojooned ja piirkonna D raja
[x,y]=meshgrid(-3:0.1:3,-3:0.1:3);
z=exp(0.2*x.^2+0.4*y.^2);
contour(x,y,z,50);
xlabel('x');
ylabel('y');
grid on
hold on
v=ezplot('2*x^2+3*x+3-y', [-3,3,-3,3])
set(v, 'color', 'r');
hold off
% defineerime signa=100
sigma=100;
% alglähend
x=-1;
y=2;
% algsamm
t=1;
t1=0.5;
% fiktiivne alglähend
xvana=1;
yvana=1;
% täpsus
eta = 1e-4;
% defineerime funktsiooni koos trahvifunktsiooniga
f=@(x,y)exp(0.2*x^2+0.4*y^2)+sigma*(max(0,2*x^2+3*x+3-y))^2;
while sqrt((x-xvana)^2+(y-yvana)^2)>=eta
    % antigradient määrab suuna, milles funktsioon kõige kiiremini kahaneb
    v1=-(exp(0.2*x^2+0.4*y^2)*0.4*x+sigma*2*max(0,2*x^2+3*x+3-y)*(4*x+3));
    v2=-(exp(0.2*x^2+0.4*y^2)*0.8*y+sigma*2*max(0,2*x^2+3*x+3-y)*(-1));
    xuus=x+t*v1;
    yuus=y+t*v2;
    while f(xuus,yuus)>=f(x,y)
        % arvutame uue sammu pikkuse juhul kui funktsioon ei kahane
        t=t*t1;
        xuus=x+t*v1;
        yuus=y+t*v2;
    end
    xvana=x;
    yvana=y;
    x=xuus;
    y=yuus;
end
x
y
    
