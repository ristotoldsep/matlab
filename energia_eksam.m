a=load('D:\SCHOOL\fortran\eksam.dat');

subplot(1,1,1)
hold on
plot(a(:,1),a(:,8))
plot(a(:,1),a(:,9))
plot(a(:,1),a(:,10))
grid on
legend('kin','pot','tot')