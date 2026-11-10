function X1=XX1(params);
 syms t s 
Rs=params.Rs;
RM=params.RM;
RA=params.RA;
Rc=params.Rc;
CR=params.CR;
Cs=params.Cs;
CA=params.CA;
Ls=params.Ls;
Emax=params.Emax;
Emin=params.Emin;
HR=params.HR;
%% Ct  CdotT
tc=60/HR;
Tmax=0.2+.15*tc;
tn=t/Tmax;
s1=1.55*(((10*tn)/7)^1.9);
s2=1+(((10*tn)/7)^1.9);
s3=1+(tn/1.17)^21.9;
En=s1/(s2*s3);
E=(Emax-Emin)*En+Emin;
Ct=vpa(inv(E));
CdotT=vpa(diff(Ct));

%% Laplace Input
f1=t;f2=t;
NumX1_1=laplace(f1/Ct);
NumX1_1=NumX1_1/RM;
NumX1_2=laplace(f2/Ct);
NumX1_2=NumX1_2/RA;
NumX1=NumX1_1-NumX1_2;
DenX1_1=s;
c1=vpa(CdotT*E);
DenX1_2=laplace(c1);
DenX1=DenX1_1+DenX1_2;
x11=vpa(NumX1/DenX1);
x12=ilaplace(x11);
X1.X=x11;
X1.x=x12;
end