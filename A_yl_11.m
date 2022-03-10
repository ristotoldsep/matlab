% Risto Tõldsep 185402IACB
% Ylesanne 11

% Defineerin v6rrandisysteemi 
F=@(x,y)[x-y^3-(1/20)*(x+y)^3;
   x-y-0.1];

% defineerin Jacobi maatriksi
Jacobi = @(x,y)[
    1-((3/20)*x^2+(6/20)*x*y+(3/20)*y^2), (3/20)*x^2+(6/20)*x*y-(57/20)*y^2;
    1,-1
    ];

% sisestame alglähenid
alg=[-1.5,-1.5;-0.25,-0.25;0.7,1.5];

% määrame täpsuse
eta = 1e-7;

% leiame kõik lahendid Newtoni meetodiga
for k=1:3
    % alglähend ja fiktiivne eelmine lähend
    x=alg(k,1);
    y=alg(k,2);
    xv=0;
    yv=0;
    loendur=0;
    while sqrt((x-xv)^2+(y-yv)^2)>=eta
        xv=x;
        yv=y;
        v=inv(Jacobi(xv,yv))*F(xv,yv);
        x=x-v(1);
        y=y-v(2);
        loendur=loendur+1;
    end;
    %format long
    vastus=[x,y]
    %format short
    sammud=loendur
end