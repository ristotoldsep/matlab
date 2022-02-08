clear
global g_maa r_maa ro_ohk_0 param1 param2 c_aero m_keha;
c_aero=0.47;r_keha=2.;
p_ohk=102500.;mu_ohk=29;
r_gaas=8314.;t_ohk=300.;
m_keha=2800;r_maa=6378.0; 
g_maa=3.986004418e+5;

s_keha=pi*r_keha*r_keha;
ro_ohk_0=p_ohk*mu_ohk/(r_gaas*t_ohk);
param1=mu_ohk*9814./(r_gaas*t_ohk);
param2=c_aero*s_keha*500./m_keha;

angle=2;
v0=7.78843;

vx=-v0*sind(angle);
vy= v0*cosd(angle);
y0=[6578.;0.;vx;vy];

time=0:1:7000;
options = odeset('RelTol',1e-6,'AbsTol',1e-6,'MaxStep',0.1,'InitialStep',0.001,'Event',@mycheck);
[t,y,te,ye,ie]=ode45(@keplerf,time,y0,options);

rr=sqrt(power(y(:,1),2)+power(y(:,2),2));
v_abs=sqrt(power(y(:,3),2)+power(y(:,4),2));
h=rr-r_maa;

for i=1:length(h)
if h(i) >=5    
param(i)=c_aero*s_keha*500./m_keha;
else
param(i)=c_aero*s_keha*500.*100./m_keha;  
end
end

rr=sqrt(power(y(:,1),2)+power(y(:,2),2));
v_abs=sqrt(power(y(:,3),2)+power(y(:,4),2));
h=rr-r_maa;
ro_ohk=ro_ohk_0*exp(-param1*h);
ax=-y(:,1)*g_maa./power(rr,3)-param2.*ro_ohk.*v_abs.*y(:,3);
ay=-y(:,2)*g_maa./power(rr,3)-param2.*ro_ohk.*v_abs.*y(:,4);
aabs=sqrt(power(ax,2)+power(ay,2))*1000.;
phi=0:1:360;
xx=sind(phi);
yy=cosd(phi);

subplot(1,3,1)

plot(xx,yy,'black')
hold on
plot(y(:,1)./r_maa,y(:,2)./r_maa,'r')
grid on
%is=60;
%ifin=77;
%quiver(y(is:ifin,1)./r_maa,y(is:ifin,2)./r_maa,ax(is:ifin),ay(is:ifin),0.5)

subplot(1,3,2)
plot(h,aabs)
xlabel ('korgus,km')
ylabel ('kiirendus, m/s^2')
grid on

subplot(1,3,3)
plot(h,v_abs)
xlabel ('korgus,km')
ylabel ('kiirus, km/s')
grid on

disp(['max kiirendus=',num2str(max(aabs)),' m/s^2'])
disp(['min kiirus=',num2str(min(v_abs)*1000.),' m/s'])
