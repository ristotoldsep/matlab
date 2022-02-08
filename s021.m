B = [2,8,-1;3,7,3;0,2,-10]
C = inv(B)
d = det(B)
D = B*B' 
E = B.*B' % koordinaatide kaupa korrutis
B1 = B(2:3, 1:2)