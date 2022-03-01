%Hariliku iteratsioonide meetod
clear
g1=@(x,y,z)exp(-x-y-z);
g2=@(x,y,z)x+sqrt(y*z);
g3=@(x,y,z)x*y*z+1;
x=0;
y=0;
z=0;
eta=0.1;
%fiktiivsed väärtused
xv=1;
yv=1;
zv=1;
%põhitsükkel
while abs(x-xv)+abs(y-yv)+abs(z-zv)>=eta
    xv=x;
    yv=y;
    zv=z;
    x=g1(xv,yv,zv);
    y=g2(xv,yv,zv);
    z=g3(xv,yv,zv);
end
x
y
z
    