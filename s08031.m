% joonestame funktsiooni nivoojooned (-10st 10ni samm 0.1)
[X,Y]=meshgrid(-10:0.1:10,-10:0.1:10);
% Defineerime funktsiooni
Z = atan(X.^2+Y.^2)+(X-1).^2+(Y-2).^2;
contour(X,Y,Z,30);
xlabel('x')
ylabel('y')
grid on