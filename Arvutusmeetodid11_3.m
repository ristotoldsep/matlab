%c0=integral(@(x)1/2*cos(pi*2)/2,-1,1)
%c2=integral(@(x)5/2*x.^2.*cos((pi.*x)/2),-1,1)

%ortogonaalse funktsiooni ülesanne
%leida integraalid matlabi või neti kaudu, käsitsi võib tulla vigu sisse

%joonestame funktsiooni lähendi lõigus [-1,1]
xi=-1:1e-2:1;
yi=polyval('2/pi+0.6030*1/2*(3*x^2-1)',xi);
plot(xi,yi)
grid on
xlabel('x')
ylabel('y')