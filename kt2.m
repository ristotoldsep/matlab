[diskr, x1, x2] = myroot(1,3,1)  %1=a , 3=b , 1=c  , ees peab olema ka kirjutatud millistele muutujatele funktsiooniga väärtused leitakse, diskriminandi kontrollimiseks lisasin ka selle    

function [diskr, x1,x2] = myroot(a,b,c) % Funktsioon x1 ja x2 arvutamiseks = funktsioon, mis võtab kolm parameetrit a, b ja c
diskr = b*b-4.*a*c; % Esmalt arvutatakse diskriminant, voib kirjutada ka diskr = power(b,2)-4.*a*c;
if(diskr > 0) % Kui diskriminant on positiivne, loetakse sisse kaks järgnevat rida, kuna antud sisendparameetrite puhul on disk 5, lõpetatakse siinkohal ka programm
x1=(-b+sqrt(diskr))/(2.*a); % Sulud valesti
x2=(-b-sqrt(diskr))/(2.*a);
return
end

%Allolevad diskriminandi kontrollid peaksid tegelikult olema funktsiooni
%sees, mitte eraldi.
if(diskr==0.) %kui diskriminant on null, siis x1=x2
x1=-b/(2.*a);
x2=-b/(2.*a);% Sulud vaja lisada
disp(['x1=x2=',num2str(x1)]); 
return
end

%Siin võiks kontrollida, kas diskriminant on väiksem kui null, aga samas
%tuleb korrektne vastus ka ilma selleta, kuna muud juhud on kaetud
x1=-b/(2.*a); % Sulud valesti
x2=(sqrt(-diskr))/2.*a;

%Korrektne oleks selline kontroll
%if (diskr < 0.)
%    x1 = -b/(2*a);
%    x2 = sqrt(-diskr)/(2*a);
%    disp([num2str(x1), '+/-i', num2str(x2)]);
%   return
%end

end % Programmi lõpp