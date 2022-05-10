% Risto Tõldsep 185402IACB
% Ylesanne 9

clear all

% Defineerime funktsioonid
f1 = @(x, y, z) z;      % z == y'
f2 = @(x, y, z) y^2 - x*(x+z);

% Algtingimused y(0) = 1  | y'(0) = 0
x0 = 0;
y0 = 1;
z0 = 0;

% L6ik [0, 3] = [x0, x1]
x1 = 3;

% Sammu pikkus
h = 0.001;

% S6lmed
x = x0:h:x1;
y(1) = y0;
z(1) = z0;

% Euleri meetod
for i = 1: ((x1 - x0) / h)
    y(i + 1) = y(i) + h*f1(x(i), y(i), z(i));
    z(i + 1) = z(i) + h*f2(x(i), y(i), z(i));
end

% Joonestame graafiku
plot(x, y)
grid on
xlabel('x')
ylabel('y')