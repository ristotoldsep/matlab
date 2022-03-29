% Miinimumpunkti leidmine koordinaatide järgi languse meetodiga (tuletist
% appi ei võta!
% Liigume koordinaattelgedega paralleelsetes suundades
%joonestame funktsiooni nivoojooned
[X,Y]=meshgrid(-2:0.1:2,-3:0.1:3);
Z=exp(0.2*(X.^2+Y.^2))+(X-1).^2+(Y+2).^2;
contour(X,Y,Z,30);
xlabel('x');
ylabel('y');
grid on