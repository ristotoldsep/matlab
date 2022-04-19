function y=pol(c,x)
y=0;
k=length(c);
for i=1:k
    y=y+c(i)*x.^(i-1);
end