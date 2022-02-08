a=load("test2.in");
n=length(a);
sum=0;
for i=1:n
    sum=+a(i);
end
disp(['Summa = ', num2str(sum)]);