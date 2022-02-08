%Siinuse arvutamine & graafikule kujutamine
x=0:5:90;
[x;sind(x)]'
plot(x,sind(x), x,cosd(x));
grid on