ezplot(@(x,y)x^2-y^2-1, [-3,3,-3,3])
grid on
hold on
h = ezplot(@(x,y)y-0.5*(x+1)^2+3, [-3,3,-3,3])
set(h,'color', 'red')
hold off