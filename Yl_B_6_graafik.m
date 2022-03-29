% joonestame funktsiooni nivoojooned
[X,Y]=meshgrid(-1:0.1:1,-1:0.1:1);
Z=(X-3).^2+(Y-1).^2+exp(X.^2+Y.^2);
contour(X,Y,Z,30);
xlabel('x')
ylabel('y')
grid on