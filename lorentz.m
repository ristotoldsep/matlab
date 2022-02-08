global qm E B 
q=1.e-9;
m=1.e-9;
% beta=0.;
qm=q/m;
time = 0:0.01:300;
% betam=beta/m;

y0=[0.;0.;0.;0.;10.;10.];
E=[0.,0.,0.];
B=[0.,0.,0.1];

options=odeset('AbsTol',1.e-6,'RelTol',1.e-6);
[t,y]=ode45(@lorentzf, time ,y0,options);

plot3(y(:,1),y(:,2),y(:,3),'r');
grid on
% xlabel('x');ylabel('y');
function dy = lorentzf(t,y)
global qm E B
dy=zeros(6,1);
dy(1)=y(4);
dy(2)=y(5);
dy(3)=y(6);
v=sqrt(power(y(4),2)+power(y(5),2)+power(y(6),2));
dy(4)=qm*(y(5)*B(3)-y(6)*B(2)+E(1));
dy(5)=qm*(y(6)*B(1)-y(4)*B(3)+E(2));
dy(6)=qm*(y(4)*B(2)-y(5)*B(1)+E(3));
end

