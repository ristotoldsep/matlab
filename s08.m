ezplot(@(x,y)3*x^2+y^2-2, [-3,3,-3,3])
grid on
hold on % HOIAB SELLE JOONISE ALLES GRAAFIKUL!
j = ezplot(@(x,y)y-x-1, [-3, 3, -3, 3])
set(j, 'color', 'red')  
hold off
