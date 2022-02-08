f1 = @(x)2*x^2-x+5;
joonis = fplot(f1,[-3,3])
set(joonis, 'color', 'green')
grid on
xlabel('x')
ylabel('y')