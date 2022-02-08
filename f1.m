function y = f1(x)
if x <= 10
    y = x;
elseif x <= 20
    y = x^2;
elseif x < 30
    y = x-1;
else 
    y = sqrt(x);
end