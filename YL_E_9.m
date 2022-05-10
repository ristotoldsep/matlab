% Risto Tõldsep 185402IACB
% Ylesanne 9

clear

% S6lmed ja funktsiooni v22rtused
x = [-0.8611 -0.34 0.34 0.8611];
A = [0.3479 0.6521 0.6521 0.3479];

f = @(x)((x^4)+6)^(1/3);
for i = 1:4
   y(i) = f(x(i));
end

integraal = sum(A.*y)