% Risto Tõldsep 185402IACB
% Ylesanne 4

clear all

% Defineerime funktsiooni tuletise
tuletis = @(x, y) (5*x - 6)^4 - y^2;

% Cauchy tingimus y(1) = 2
x0 = 1;
y0 = 2;

% L6ik [1, 4] = [x0, x1]
x1 = 4;

% Sammu pikkus
h = 0.02;

% Koostame tabeli
x = x0:h:x1;
trapets(1) = y0;

for i = 1: ((x1 - x0) / h)
    % Abifunktsioon
    g = @(z) z - trapets(i) - (h / 2)*(tuletis(x(i), trapets(i)) + tuletis(x(i+1), z));
    
    % Lahendame v6rrandi
    trapets(i+1) = fzero(g, trapets(i));
end

% Joonestame graafiku
plot(x, trapets)
grid on
xlabel('x')
ylabel('y')