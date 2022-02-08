%Ruutvõrrandi lahendamine MATLAB-is
clear % Puhastab eelnevad muutujad m2lust
a = input("Sisesta a v22rtus: ");
b = input("Sisesta b v22rtus: ");
c = input("Sisesta c v22rtus: ");

diskr = power(b,2)-4.*a*c;

if (diskr > 0.)
    x1 = (-b + sqrt(diskr))/(2*a);
    x2 = (-b - sqrt(diskr))/(2*a);
    
    %Dispiga saab valjastada 1 muutuja!
    %disp(['x1 = ', x1, '| x2 = ', x2]);
    disp(['x1 = ', num2str(x1), ' x2= ', num2str(x2)]);
    return
end

if (diskr == 0.)
    x1 = -b/(2*a);
    disp(['x1=x2= ', num2str(x1)]);
    return
end

if (diskr < 0.)
    x1 = -b/(2*a);
    x2 = sqrt(-diskr)/(2*a);
    disp([num2str(x1), '+/-i', num2str(x2)]);
    return
end


