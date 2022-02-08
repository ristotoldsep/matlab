a = load("D:\SCHOOL\fortran\fall.dat");
hold on
sphere(50)
r_maa = 6371.;
plot3(a(:,2)/r-maa, a(:,3)/r_maa, a(:,4)/r_maa)
grid on