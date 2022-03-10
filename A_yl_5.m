% Risto Tõldsep 185402IACB
% Ylesanne 5

% Defineerin v6rrandisysteemi 
F = @(x)[
    x(1)^2-x(2)^3*sin(x(2))+x(3)-3
    3.*x(1)-x(3)-2
    x(2)+cos(x(3))-4
    ];

% defineerin Jacobi maatriksi
Jacobi = @(x)[2.*x(1), -3.*x(2)^2.*sin(x(2))-x(2)^3.*cos(x(2)), 1
    3., 0., -1.
    0., 1., -sin(x(3))
    ];

% Algl2hend
x = [1; 3; 1];
xv = [0; 0; 0];

% määrame täpsuse
eta = 1e-7;

% muutuja iteratsioonide loendamiseks
loendur = 0;

% iteratsioonitsükkel
while norm(x - xv, 1) >= eta
    xv = x;
    x = x - inv(Jacobi(xv))*F(xv);
    loendur = loendur + 1;
end

% Kuvame tulemused
format long
x
sammud=loendur
format short
