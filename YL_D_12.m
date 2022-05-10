% Risto Tõldsep 185402IACB
% Ylesanne D 12.

% V6rrandisysteemi kordajad
A = [2.2 4.3;
    3.5 -1.07;
    4.21 -2.33;
    5.33 -4.28;
    6.11 -6.15;
    8.04 -10.7];

% V6rrandisysteemi v22rtused
y = [803;
    711;
    622;
    501;
    386;
    225];

for i = 1:2
    b(i) = y'*A(:, i);
    for j = 1:2
        alpha(i, j) = A(:, i)'*A(:, j);
    end
end

x = inv(alpha)*b'
% x =  [188.9445
%  116.2804]