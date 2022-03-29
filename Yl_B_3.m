% Risto Tõldsep 185402IACB
% Ylesanne 3

clear all

% Defineerin funktsiooni
f = @(x, y, z) (x + 1)^2 + (y - 4)^2 + (z + 5)^2 + x^4 + 2*y^4 + 3*z^4;

% Algl2hendid
x = 0;
y = 0;
z = 0;
xv = 1;
yv = 1;
zv = 1;

% T2psus
eta = 10^-4;

% Algne sammupikkus
t = 1;

% V2hendamise tegur
ti = 0.5;

% Loenduri muutuja
loendur = 0;

% Iteratsioonitsykkel gradientmeetodiga
while sqrt((x - xv)^2 + (y - yv)^2 + (z - zv)^2) >= eta
    % Antigradiendid
    v1 = -1*(2*(x + 1) + 2*x*exp(x.^2 + y.^2 + z.^2));
    v2 = -1*(2*(y - 4) + 2*y*exp(x.^2 + y.^2 + z.^2));
    v3 = -1*(2*(z + 5) + 2*z*exp(x.^2 + y.^2 + z.^2));
    
   % Uued l2hendid
   xu = x + t*v1;
   yu = y + t*v2;
   zu = z + t*v3;
   
   % Kontroll
   while f(xu, yu, zu) >= f(x, y ,z)
       t = t*ti;
       xu = x + t*v1;
       yu = y + t*v2;
       zu = z + t*v3;
       
   end
   
   % Defineerime eelmise sammu l2hendid
   xv = x;
   yv = y;
   zv = z;
   
   % Defineerime eelmise sammu l2hendid
   x = xu;
   y = yu;
   z = zu;
   
   % Suurendame loendurit
   loendur = loendur + 1;
end

% Kuvame l6pptulemused
disp('L6pptulemus')
loendur
disp('Miinimumpunkt')
x
y
z
disp('Minimaalne v22rtus')
f(x, y, z)