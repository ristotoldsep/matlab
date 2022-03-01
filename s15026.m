%ÜL 4.5 (lk 68)
clear
x=[1,1,1]';
eta=1e-3;
w=1.4;
%fiktiivsed väärtused
xv=[0,0,0]';
%põhitsükkel
k=0;
while norm(x-xv,inf)>=eta
    xv=x;
    x(1)=w*1/3.1*(1-2.8*xv(2))+xv(1)*(1-w);
    x(2)=w*1/4.7*(3.2-2.8*x(1)+1.8*xv(3))+xv(2)*(1-w);
    x(3)=w*1/2.5*(1.6+1.8*x(2))+xv(3)*(1-w);    
    k=k+1;
end
disp('vastus')
disp(x)
k