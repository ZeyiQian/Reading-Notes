% This script constructs the data to calculate the trade elasticities
% in Caliendo Parro (2014)
clc
clear all

% Number  =    1   2   2   4   5   6   7   8    9   10 11  12  13 14  15  16  
% Countries = ARG AUS CAN CHE CHL CHN COL EU25 IDN IND JPN KO NOR NZL THA USA 

load 'xbilats_93.mat' % Bilateral Trade matrix  for a sample of 16 countres for each sector (4 digit ISIC Rev.3) 1993
% source Comtrade
load 'tau.mat'        % Bilateral AHS tariff matrix (4 digit ISIC Rev.3) 1993 source
%************** DESCRIPTION OF AHS *****************
% Effectively Applied Tariff (AHS) is defined as the MFN Applied tariff unless a preferential tariff (PRF) exists 
% source WITS-TRAINS - weighted tariffs
 
IDProduct = importdata('IDProduct_2.txt'); % ISIC 4 digit Rev.3 Product ID 

% Fixing for missing tariff data
% for the case where there is a missing, we search for values in
% adjacent years
[JN N] = size(xbilats_93); J = JN/N;
for i = 1:1:N
    for j = 1:1:N*length(IDProduct)
        if isnan(tau_93(j,i)) == 1
         if isnan(tau_92(j,i)) == 1
            if isnan(tau_91(j,i)) == 1
            if isnan(tau_90(j,i)) == 1
                if isnan(tau_89(j,i)) == 1
                    if isnan(tau_94(j,i)) == 1
                        if isnan(tau_95(j,i)) == 1 
                        else
                        tau_93(j,i)=tau_95(j,i);
                        end                
                    else
                    tau_93(j,i)=tau_94(j,i);
                    end
                else
                tau_93(j,i)=tau_89(j,i);
                end
            else
            tau_93(j,i)=tau_90(j,i);
            end
            else
            tau_93(j,i)=tau_91(j,i);
            end
            else
            tau_93(j,i)=tau_92(j,i);
            end

        end
    end
end

% Import concordance table, (4 digit ISIC Rev.3 to 2 digit ISIC Rev.3)
concord = importdata('concordance2.txt'); J = length(concord);

% Aggregating (Concording) data
for j = 1:1:6
    x1 = zeros(N);
    F1 = zeros(N);
    for i = concord(j,2):1:concord(j,3)
    S93 = (tau_93(1 + (i-1)*N : i*N, :));
    F1 = 1 + F1 - isnan(S93);
    sel1 = find(isnan(S93));
    S93(sel1) = 0;
    x1 = x1 + S93;
    end
    T_93(1 + (j-1)*N : j*N , :) = x1./F1;
    clear S93
end
for j = 1:1:6
    x1 = zeros(N);
    F1 = zeros(N);
    for i = concord(j,2):1:concord(j,3)
    sx93 = (xbilats_93(1 + (i-1)*N : i*N, :));
    F1 = 1 + F1 - isnan(sx93);
    sel1 = find(isnan(sx93));
    sx93(sel1) = 0;
    x1 = x1 + sx93;
    end
    X_BILATS93(1 + (j-1)*N : j*N , :) = x1;
    clear sx93
end
for j= 7:1:J;
 T_93(1 + (j-1)*N : j*N , :) =  tau_93 (1 + (10+j-1)*N : (10+j)*N , :);
 X_BILATS93(1 + (j-1)*N : j*N , :) =  xbilats_93 (1 + (10+j-1)*N : (10+j)*N , :);
end

% Removing China from Chemicals
T_93(118,:)=NaN;

% setting number of sectors and countries
[JN N] = size(X_BILATS93); J = JN/N;

% Constructing the Caliendo and Parro stat
for j = 1:1:J
  X93 = T_93(1 + (j-1)*N : j*N , :);
  X94 = T_93(1 + (j-1)*N : j*N , :);
  Y93 = X_BILATS93(1 + (j-1)*N : j*N , :);
  Y94 = X_BILATS93(1 + (j-1)*N : j*N , :);
  [lnX9394(:,j) lnY9394(:,j) Y_93(:,j) Y_94(:,j) X_93(:,j) X_94(:,j) XX_93(:,j) YY_93(:,j)] = CP_stat(X93,X94,Y93,Y94,N);
end

% Droping observation with zero trade flows i.e. Y_93 or X_93 = inf
for j = 1:1:J
    for e = 1:1:length(Y_93)
        if Y_93(e,j) == Inf
            Y_93(e,j) = NaN;
        elseif Y_93(e,j) ==-Inf
            Y_93(e,j) = NaN;                
        end
    end
end
for j = 1:1:J
    for e = 1:1:length(Y_93)
        if X_93(e,j) == Inf
            X_93(e,j) = NaN;
        elseif X_93(e,j) ==-Inf
            X_93(e,j) = NaN;                
        end
    end
end

% FIXED EFFECTS ESTIMATION
D = CP_statD(N); % constructing FE

DATA_OUT_100 = [];
  for j = 1:20
        DATA_OUT_100 = [DATA_OUT_100 ; [j*ones(length(Y_93(:,j)),1) Y_93(:,j) X_93(:,j) D]]; 
  end
  
  % EXPORTING DATA
  csvwrite('DATA_OUT_100.csv',DATA_OUT_100)
 