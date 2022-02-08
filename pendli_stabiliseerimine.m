% parameetrite initsialiseerimine
g = 9.8; M = 2; m = 0.2; l = 0.6;

% olekumudeli maatriksite sisestamine
A = [0 1 0 0; g*(M + m)/(M*l) 0 0 0; 0 0 0 1; -m/M*g 0 0 0]
B = [0; -1/(M*l); 0; 1/M]
C = eye(4) % ühikmaatriksi loomine et Y = X
D = zeros(4,1) % nullise maatriksi loomine
sys=ss(A,B,C,D) % olekumudeli maatriksite koondamine ühe nime alla 
% Juhitava süsteemi pidevajamudel!

ov=eig(sys.a) % omaväärtused ja stabiilsuse määramine
rank(ctrb(sys)) % juhitavuse kontroll

td = 0.1 % diskreetimissamm (-takt)
sysd=c2d(sys,td) % süsteemi diskreetimine sammuga td
ovz=eig(sysd), plot(real(ovz),imag(ovz),'x'),zgrid % diskreetaja olekumudeli omaväärtused

Z = [0.6 0.65 0.7 0.75] % soovitud suletud süsteemi omaväärtused
plot(real(Z),imag(Z),'*');zgrid

K = place(sysd.a, sysd.b, Z) % tagasisidemaatriksi arvutus suletud süsteemi pooluste paigutusega (pole placement)

