%joonestame funktsiooni
%g(t)=sin(t^4+t)+t^2-3t-4 graafiku
f=@(t)sin(t^4+t)+t^2-3*t-4;
fplot(f, [1,2])
grid on