function X4=XX4(params);
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
Ct=1/E;
CdotT=diff(Ct);
%% Laplace Input
f1=t;f2=t;
Lf1=laplace(t);
Lf2=laplace(t);
NumX4=Lf1;
DenX4=CA*RA*(s+(1/CA));
x41=NumX4/DenX4;
x42=ilaplace(x41);
X4.X=x41;
X4.x=x42;
end