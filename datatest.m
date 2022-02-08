a=load('D:\SCHOOL\fortran\eksam.dat');

t=1:100:length(a(:,1));
subplot(1,2,1);
hold on
plot(a(t,2),a(t,3));

grid on
legend('Trajektoor')