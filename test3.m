%FAKTORIAALI arvutamine
n=input("Enter n=");
fact=1;
if(fix(n)~=n)
    disp('n ei ole täisarv');
    return
end
if(n<0)
    disp('Sisestatud on negatiivne arv, millele pole v6imalik faktoriaali arvutada');
    return
end
if(n==0 || n==1)
    disp([num2str(n)])
    return
end
for i=1:n
    fact=fact*i;
end
disp([num2str(n),'! = ',num2str(fact)]);

