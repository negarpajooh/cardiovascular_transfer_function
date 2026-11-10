 % Writed by: Mojtaba Hasanlou - 1394/5/27
 % E-mail: mh136798@gmail.com
 % Mobile : 09198470686
clear;
clc;
close all
format long
global params
%% Plot Parameters
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =20 ;      % Fontsize
lw = 1;        % LineWidth
msz = 8;       % MarkerSize
%% Constants
Rs=1;
RM=0.005;
RA=0.001;
Rc=0.0398;
CR=4.4;
Cs=1.33;
CA=0.08;
Ls=0.0005;
Emax=2;
Emin=0.06;
Tmax=10; 
HR=1;
%%
params=[Rs,RM,RA,Rc,CR,Cs,CA,Ls,Emax,Emin,Tmax,HR];
%%
sim('SM')
%% Evaluated
dT=.1;
T=0:dT:10;
xx1=subs(X1.x1,t,T);
xx2=subs(X2.x2,t,T);
xx3=subs(X3.x3,t,T);
xx4=subs(X4.x4,t,T);
xx5=subs(X5.x5,t,T);
%% Result
%% Figure 1
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(T,xx1,'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('TPF - L/min','fontsize',fsz-5,'FontName','Times New Roman')
grid minor
%% Figure 2
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(T,xx2,'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('TPF - L/min','fontsize',fsz-5,'FontName','Times New Roman')
grid minor
%% Figure 3
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(T,xx3,'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('TPF - L/min','fontsize',fsz-5,'FontName','Times New Roman')
grid minor
%% Figure 4
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(T,xx4,'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('TPF - L/min','fontsize',fsz-5,'FontName','Times New Roman')
grid minor
%% Figure 5
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(T,xx5,'linewidth',2)
title('','fontsize',fsz-5,'FontName','Times New Roman')
xlabel('Time - sec','fontsize',fsz-5,'FontName','Times New Roman')
ylabel('TPF - L/min','fontsize',fsz-5,'FontName','Times New Roman')
grid minor









