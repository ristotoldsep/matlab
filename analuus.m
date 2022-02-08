%sys = rss(3,2,3) % juhuslik olekumudel (ss –state-space)
%A=[-3 1 2;0 -1 0;0 2 -4], B=[0 1;0 0;1 4], C=[0 2 0;0 2 1;1 0 3], D=[0 0; 0 0;1 0]
A=[1 0;2 -2], B=[-2; -1], K=[0 0]
sys = ss(A,B,C,D) % teada olevate A,B,C ja D maatriksitega olekumudel

Qc = ctrb(sys) % süsteemi juhitavuse maatriks
rank(Qc) % juhitavuse kontroll
Qo = obsv(sys) % jälgitavuse maatriks
rank(Qo) % jälgitavuse kontroll

ov=eig(sys) % omaväärtuste arvutamine
ukf=tf(sys) % teisendamine ülekandefunktsioonideks
 
ltiview(sys) % LTI Viewer
dcgain(sys) % staatilised ülekandetegurid
