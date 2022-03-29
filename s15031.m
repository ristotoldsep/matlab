% leiame funktsiooni miinimumpunkti kaasgradient meetodiga ül 5.8 lk 103
% sisestame algandmed
A=[2, 1, -0.3;
   1, 2, 0;
   -0.3, 0, 1];
b=[1,-2,1]'; % transponeeritud!
% Alternatiiv: b=[1;-2;1]
% defineerime alglähendi
x=[0,0,0]';
v=-2*A*x-b;
w=v;
z=v'*v;
r=A*w;
% Sisestame täpsuse, et iteratsioon peatada
eta=1e-9
loendur=0;
while sqrt(v'*v)>=eta
    tau=(v'*w)/(2*w'*r);
    x=x+tau*w;
    v=v-2*tau*r;
    zuus=v'*v;
    omega=zuus/z;
    w=v+omega*w;
    r=A*w;
    loendur=loendur+1;
end
disp('Lõpptulemus')
x
% mitu korda peab itereerima, et jõuda täpsuseni 1e-9?
loendur 