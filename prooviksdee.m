clear
g=3.27;
ca=0.47;
m_keha=100; 
mu=44.;
temp=200;
r_gaas=8314.;
r_keha=100;
p_ohk=600;
dt=0.01;
nt=200000;
at=zeros(nt,3);

v_keha=4.*pi*r_keha^3/3.;
s_keha=pi*r_keha^2;
ro_ohk_0=p_ohk*mu/(r_gaas*temp);
ro_keha=m_keha/v_keha;

param1=0.5*ca*s_keha/m_keha;
param2=mu*g/(r_gaas*temp);
x=0;v=0.;
 for i=1:nt
     ro_ohk=ro_ohk_0*exp(-param2*x);
     a=(ro_ohk/ro_keha-1)*g-param1*ro_ohk*abs(v)*v;
     x=x+v*dt+0.5*a*dt*dt;
     v=v+a*dt;

     at(i,1)=i*dt;
     at(i,2)=x;
     at(i,3)=v;
     
     if x < 0
     break
     end
 end


plot (at(1:i,1),at(1:i,3))
grid on