x = 0:1e-3:3;
y = sin(x);
z = cos(x);
plot(x,y,x,z)
xlabel('x')
ylabel('y')
grid on
legend('sin x', 'cos x')
