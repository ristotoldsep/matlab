% joonestame funktsioonide x^2+y^3=1 ja
% 2x^3+7cos(y-2x)=4 graafikud
ezplot('x-y^3-(1/20)*(x+y)^3')
hold on
ez=ezplot('x-y-0.1')
set(ez,'color','r')
grid on
hold off