clear
clf
r=load('D:\SCHOOL\fortran\fall.dat');
r_maa=6378.;

subplot(1,3,1)
hold on
axis equal
im= imread('earth1.jpg');
[x,y,z]=sphere(50);
surf(x,y,-z,im,'FaceColor','texturemap','edgecolor','none')
plot3(r(:,2)/r_maa,r(:,3)/r_maa,r(:,4)/r_maa,'r')
grid on

subplot(1,3,2)
plot(r(:,8),r(:,10))
xlabel ('korgus,km')
ylabel ('kiirendus, m/s^2')
grid on

subplot(1,3,3)
plot(r(:,8),r(:,9))
xlabel ('korgus,km')
ylabel ('kiirus, km/t')
grid on

disp(['max kiirendus=',num2str(max(r(find(r(:,6)>5.5),8))),' m/s^2'])
disp(['min kiirus=',num2str(min(r(:,7))),' m/s'])
