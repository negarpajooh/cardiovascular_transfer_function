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
HR=60;
Lstar=10;  %%%%%
Rstar=100; %%%%%
gamma=89944;

%%
params=[Rs,RM,RA,Rc,CR,Cs,CA,Ls,Emax,Emin,Tmax,HR,Lstar,Rstar,gamma];
%%






