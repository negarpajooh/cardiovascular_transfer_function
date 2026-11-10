 % Writed by: Mojtaba Hasanlou - 1394/5/27
 % E-mail: mh136798@gmail.com
 % Mobile : 09198470686
clear;
clc;
close all
format long
%% Plot Parameters
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =20 ;      % Fontsize
lw = 1;        % LineWidth
msz = 8;       % MarkerSize
%% Constants
Clvd=10;
Rv=0.004;
Rav=0.002;
CA=1.83;
Cv=70;
L=0.01;
Clvs=10;  %%%%%%%%%%%%
Clv1=10;
ClvR=10;
a0=10e-2;a1=10e-2;a2=10e-2;
w=1;
%% Inputs
Input='Step';  
t=0.0001:1:60;
u=double(t>0)';
deltaP =wgn(numel(t),1,0);
deltaM =wgn(numel(t),1,0);
TPR=.5;
%% Diastole
Ad=[-1/Clvd,1/(Clvd*Rv),1/CA
    1/(Cv*Rv),-1/(Cv*Rv),(1/CA)+(1/Cv)
    0,-1/L,-TPR/L];
B1d=[-(1/Clv1)-(1/CA);-1/CA;0];
B3=[0;0;1/L];
B4=[-1;0;0];
C=[-1,0,0];
D=[];
BstarD=[B1d,B3,B4];
sysd=ss(Ad,BstarD,C,D);
%% Systole
As=[0,0,1/CA
    0,0,(1/CA)+(1/Cv)
    0,-1/L,-TPR/L];
B1s=[-(1/Clvs)-(1/CA);-1/CA;0];
B2=[1/(ClvR*Rv);-1/(Cv*Rv);0];
BstarS=[B1s,B2,B3];
sysS=ss(Ad,BstarS,C,D);
[ys,~,xs]=lsim(sysS,[u,deltaP,deltaM],t);
%%
% DeltaP=ys;
% Q=w*(a2.*((DeltaP./(w^2)).^2)+a1.*(DeltaP./(w^2))+a0);
Q=wgn(numel(t),1,0);
Q8=u;
[yd,~,xd]=lsim(sysd,[Q,deltaP,deltaM],t); 
DeltaP=ys;
Qs=Q+Q8;  
%% LVAD
Rpv=(xs(:,2)+deltaP-xs(:,1))/Qs(end,1);
for i=1:numel(Rpv)
A_LVAD=[-1/Clvd,1/(Clvd*Rpv(i)),1/CA
        1/(Cv*Rpv(i)),-1/(Cv*Rpv(i)),(1/CA)+(1/Cv)
        0,-1/L,-TPR/L];
B1=B1d;
B_LVAD=[B1,B2,B3];
C_LVAD=C;
sysLVAD=ss(A_LVAD,B_LVAD,C_LVAD,D);
[y,t,x]=lsim(sysLVAD,[Qs,deltaP,deltaM],t);
X(i).x=x;
end
%% Vs
Vs=Clvd.*PLV+CV.*PV+CA.*PA;%+Vs
%% LVAD
i=2;
coef1=-Clvd/(Clvd+CA+Cv);
coef2=-Cv/(Clvd+CA+Cv);
PA=coef1.*X(i).x+coef1.*X(i).x;
PLV=X(i).x+PA;
PV=X(i).x+PA;
TPF=X(i).x;
%% Figure 1 x(:,1)
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(t,X(1).x(:,1),'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('P_LV - mmHg','fontsize',fsz-5,'FontName','Times New Roman')
grid minor
%% Figure 2
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(t,x(:,2),'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('TPF - L/min','fontsize',fsz-5,'FontName','Times New Roman')
grid minor
%% Figure 3
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(t,x(:,3),'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('P_A - mmHg','fontsize',fsz-5,'FontName','Times New Roman')
grid minor
%% Figure 4
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(t,x(:,3),'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('P_V - mmHg','fontsize',fsz-5,'FontName','Times New Roman')
grid minor












