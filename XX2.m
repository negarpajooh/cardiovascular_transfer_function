function X2=XX2(params,X5);
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

syms t s
Rs=params.Rs;
RM=params.RM;
% RA=params.RA;
% Rc=params.Rc;
CR=params.CR;
Cs=params.Cs;
% CA=params.CA;
% Ls=params.Ls;
a2=X5/(Rs*Cs*CR)*(s+(1/(Rs*Cs)));
b2=-Lf2/(CR*RM);
c2=s+(1/Rs*Cs);
% d2=(Rs^2)*(CR*Cs)*(s+(1/(Rs*Cs)))*(s+(1/Rs*Cs));
d2=1+1/((Rs^2)*(CR*Cs)*(s+(1/(Rs*Cs)))*(s+(1/(Rs*Cs))));
x21=(a2+b2)/(c2*d2);
x22=ilaplace(x21);
X2.X=x21;
X2.x=x22;


end