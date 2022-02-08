%Ruutvõrrandi lahendamine MATLAB-is funktsiooniga
clear % Puhastab eelnevad muutujad m2lust
a = input("Sisesta a v22rtus: ");
b = input("Sisesta b v22rtus: ");
c = input("Sisesta c v22rtus: ");
[diskr, x1, x2] = myroot(a,b,c);
disp(['diskr = ', num2str(diskr),' x1 = ', num2str(x1), ' x2= ', num2str(x2)]);


function [diskr, x1, x2] = myroot(a,b,c)
    diskr = power(b,2)-4.*a*c;
    x1 = (-b + sqrt(diskr))/(2*a);
    x2 = (-b - sqrt(diskr))/(2*a);
    return
end
