% Caliendo Parro (2014)
% This table presents the results of the estimated elasticities using
% Caliendo Parro (2014)
% The estimations are done for the full sample, 99% sample, 97.5% sample
% with and without fixed effects

clc
clear all

% LOADING SECTORAL ELASTICITY
S = importdata('sectoral_results.csv');

T_100 = S.data(:,1); T_100_se = S.data(:,2); N_100 =S.data(:,3);
T_100_FE = S.data(:,4); T_100_FE_se = S.data(:,5); N_100_FE =S.data(:,6);
T_99 = S.data(:,7); T_99_se = S.data(:,8); N_99 =S.data(:,9);
T_99_FE = S.data(:,10); T_99_FE_se = S.data(:,11); N_99_FE =S.data(:,12);
T_975 = S.data(:,13); T_975_se = S.data(:,14); N_975 =S.data(:,15);
T_975_FE = S.data(:,16); T_975_FE_se = S.data(:,17); N_975_FE =S.data(:,18);

% LOADING AGGREGATE ELASTICITY
A = importdata('aggregate_results.csv');

T_A_100 = A.data(:,1); T_A_100_se = A.data(:,2); N_100_A =A.data(:,3);
T_A_99 =  A.data(:,4); T_A_99_se = A.data(:,5); N_99_A =A.data(:,6);
T_A_975 = A.data(:,7); T_A_975_se = A.data(:,8); N_975_A = A.data(:,9);

% CONSTRUCTING TABLES WITH RESULTS
J = 20;
sep = [blanks(J)' blanks(J)' blanks(J)' blanks(J)' ];
seps = [blanks(J)' blanks(J)' ];

sectors =[' Agriculture    ';' Mining         ';' Food           ';' Textile        ';
' Wood           ';' Paper          ';' Petroleum      ';' Chemicals      ';
' Plastic        ';' Minerals       ';' Basic metals   ';' Metal products ';
' Machinery nec  ';' Office         ';' Electrical     ';' Com            ';
' Medical        ';' Auto           ';' Other Transport';' Other          '];

disp('                Table 1      Dispersion-of-productivity estimates                       ')
disp('========================================================================================')
disp('                         Full sample           99% sample             97.5% sample      ')
disp(' Sector            theta     s.e.     N   theta     s.e.     N     theta     s.e.     N ')
disp('----------------------------------------------------------------------------------------')
disp( [sectors sep num2str(-T_100,3) sep  num2str(T_100_se,3) sep num2str(N_100) ...
    seps num2str(-T_99,3) sep  num2str(T_99_se,3) sep num2str(N_99) ...
    seps num2str(-T_975,3) sep  num2str(T_975_se,3) sep num2str(N_975)])
disp('----------------------------------------------------------------------------------------')
disp( ['Aggregate =         ' num2str(-T_A_100,3) blanks(4) num2str(T_A_100_se,3) blanks(4) num2str(N_100_A)...
    blanks(3) num2str(-T_A_99,3) blanks(4) num2str(T_A_99_se,3) blanks(4) num2str(N_99_A)...
  blanks(3) num2str(-T_A_975,3) blanks(4) num2str(T_A_975_se,3) blanks(4) num2str(N_975_A) ])
disp('=========================================================================================')
disp([ blanks(2)' ])


disp('         Table A.2    Dispersion-of-productivity estimates (with fixed effects)         ')
disp('========================================================================================')
disp('                         Full sample           99% sample             97.5% sample      ')
disp(' Sector            theta     s.e.     N   theta     s.e.     N     theta     s.e.     N ')
disp('----------------------------------------------------------------------------------------')
disp( [sectors sep num2str(-T_100_FE,3) sep  num2str(T_100_FE_se,3) sep num2str(N_100_FE)...
    seps num2str(-T_99_FE,3) sep  num2str(T_99_FE_se,3) sep num2str(N_99_FE) ...
    seps num2str(-T_975_FE,3) sep  num2str(T_975_FE_se,3) sep num2str(N_975_FE)])
disp('----------------------------------------------------------------------------------------')


  
  
