% Risto Tõldsep 185402IACB
% Ylesanne 1

clear

n = 9;  % Punktide arv
h = 0.01;  % Sammu suurus

% Sisestan tabeli
x = 0.51:h:0.59;
y = [
    1.555 
    1.557 
    1.558 
    1.557 
    1.556 
    1.554 
    1.551 
    1.552 
    1.554
];

% Arvutan otspunkti x = 0.51 tuletised
y1(1) = (4*y(2) - y(3) - 3*y(1)) / (2*h);
y2(1) = (2*y(1) - 5*y(2) + 4*y(3) - y(4)) / h^2;

% Arvutan tuletised vahemikus [2, 8]
for i = 2:n-1
    y1(i) = (y(i+1) - y(i-1)) / (2*h);
    y2(i) = (y(i-1) - 2*y(i) + y(i+1)) / h^2;
end

% Arvutan otspunkti x = 0.59 tuletised
y1(n) = (3*y(n) - 4*y(n-1) + y(n-2)) / (2*h);
y2(n) = (2*y(n) - 5*y(n-1) + 4*y(n-2) - y(n-3)) / h^2;

% V2ljastan tulemused
x
y
y1
y2