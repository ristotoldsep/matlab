% Risto Tõldsep 185402IACB
% Ylesanne 6

% clear all

% Defineerin funktsiooni
f = @(x, y) (x - 3).^2 + (y - 1).^2 + exp(x.^2 + y.^2);

% Algl2hendid
x = 0;
y = 0;
xv = 1;
yv = 1;

% T2psus
eta = 10^-3;

% Kuldl6ike t2psus
eta2 = 10^-4;

% Sihi algv22rtus
siht = 1;

% Loenduri muutuja
loendur = 0;

% Iteratsioonitsykkel languse meetodiga
while max(abs(x-xv),abs(y-yv))>=eta
    % Muudame sihi märki iga tsykli alguses
    siht = -siht;
    
    % Kuldl6ike meetod
    % Algl6ik [-10, 10]
    a = -10;
    b = 10;
    c = b - 2/(1 + sqrt(5))*(b - a);
    d = a + 2/(1 + sqrt(5))*(b - a);
    
    if siht < 0
        % Liigume x-telje sihis
        fc = f(x + c, y);
        fd = f(x + d, y);
    else
        % Liigume y-telje sihis
        fc = f(x, y + c);
        fd = f(x, y + d);        
    end
    
    % Kuldl6ike kontroll
    while abs(b - a) >= eta2
        if fc < fd
            b = d;
            d = c;
            c = b - 2/(1 + sqrt(5))*(b - a);
            fd = fc;
            
            % Vastavalt sihile leiame uue punkti C
            if siht < 0
                fc = f(x + c, y);
            else
                fc = f(x, y + c);
            end
        else
            a = c;
            c = d;
            d = a + 2/(1 + sqrt(5))*(b - a);
            fc = fd;
            
            % Vastavalt sihile leiame uue punkti C
            if siht < 0
                fd = f(x + d, y);
            else
                fd = f(x, y + d);
            end
        end
    end
    
    % Lyhendame sammu
    samm = (a + b)/2;
    
    % Uued l2hendid
    if siht < 0
        xv = x;
        x = x + samm;
    else
        yv = y;
        y = y + samm;
    end
    
    % Suurendame loendurit
    loendur = loendur + 1;
    
end

% Kuvame l6pptulemused
disp('L6pptulemus')
loendur
disp('Miinimumpunkt')
x
y
disp('Minimaalne v22rtus')
f(x, y)