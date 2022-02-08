%% Input Parameters
v=0:100;
t=v;
g=9.8;
h=10000;
r = 1
Mass = 0.1
C = 0.47
T = 200
p0=0.006*10^5 
S=pi*r^2
Air_drag =-0.5.*C.*S.*p0
 
%% Calculation
x= v./T;
VelocityWRTx=v.*x;
accelerationWRTx=VelocityWRTx./T;
KE=0.5.*Mass.*C.^2.*v;
PE= Mass.*g.*h./v
%% Plotting
subplot(2,2,1)
plot(t,x)
grid on
title('Coordinates graph at T')
subplot(2,2,2)
plot(t,VelocityWRTx)
grid on
title('Speed graph at T')
subplot(2,2,3)
plot(t,KE)
grid on
title('Speed graph at T')
subplot(2,2,4)
plot(t,PE)
title('Speed graph at T')
grid on