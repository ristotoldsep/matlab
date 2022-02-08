clear
a = load("D:\SCHOOL\fortran\out3.dat");
b = load("D:\SCHOOL\fortran\kpt.dat");
subplot(1,2,1);
plot(a(:,2),a(:,3))
quiver(a(:,2),a(:,3),a(:,4),a(:,5))
quiver(a(:,2),a(:,3),a(:,6),a(:,7))
grid on
legend('trajektoor')
subplot(1,2,2)
hold on
plot(b(:,1),b(:,2))
plot(b(:,1),b(:,3))
plot(b(:,1),b(:,4))
legend('ekin','epot','etot')


