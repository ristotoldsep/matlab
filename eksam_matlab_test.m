global  ro_keha ro_atm_0 g_rask param1 param2 v_abs ro_ohk
 
g_rask=3.711;
r_keha=0.05;
c_keha=0.47;
m_keha=1;
p_atm=600.;
mu_atm=44.;
r_gaas=8314.;
t_atm=200.;
 
s_keha=pi*r_keha^2;
v_keha=4.*pi*r_keha^3/3.;
ro_atm_0=p_atm*mu_atm/(r_gaas*t_atm);
ro_keha=m_keha/v_keha;
 
 
param1=0.5*c_keha*s_keha/m_keha;
param2=g_rask*mu_atm/(r_gaas*t_atm);
 
y0=[0.;0.;3.5;3.5];
options=odeset('RelTol',1.e-7,'AbsTol',1.e-7,'MaxStep',0.001,'InitialStep',0.0011,'Event',@mycheck) ;
[t,y,te,ye,ie]=ode45(@func,[0 5],y0,options);
subplot (1,1,1)
plot(y(:,1),y(:,2))
grid on
legend('Trajektoorr')
 
function dy = func(t,y)
global ro_keha ro_atm_0 g_rask param1 param2 v_abs ;
dy=zeros(4,1);
v_abs=sqrt((y(3))*(y(3))+y(4)*y(4));
roh=ro_atm_0*exp(-param2*y(2));
param3=g_rask*(roh/ro_keha-1.);
param4=param1*roh;
dy(1)=y(3);
dy(2)=y(4);
dy(3)=-param4*v_abs*(y(3));
dy(4)=param3-param4*v_abs*y(4);
end
 
function [h,finish,dir]= mycheck(t,y)
h=[y(2)];
finish=[1]; 
dir=[0];
end
