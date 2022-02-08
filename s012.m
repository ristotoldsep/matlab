clear
[x,y] = meshgrid(-2:1e-1:2,-5:1e-1:5);
z = x.^2-sin(y); %punkt = Vektor koosneb koordinaatide ruutudest? (aitab kuidagi arvutusel)
surf(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')