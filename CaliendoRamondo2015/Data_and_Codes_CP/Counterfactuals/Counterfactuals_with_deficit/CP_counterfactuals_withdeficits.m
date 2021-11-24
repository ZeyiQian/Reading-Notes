% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Main Program to run counterfactuals without trade deficits
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all
clc

vfactor  = -0.2;    %adjustment factor
tol      = 1E-07;   %tolerance
maxit    = 1E+10;   %max number of 

load initial_condition_1993_withS 

In = (VAn+sum(X0.*(1-F))'-Sn);                               % total income
tau1993=importdata('tariffs1993.txt');                       % tariffs 1993  
tau2005=importdata('tariffs2005.txt');                       % tariffs 2005
tau=[1+tau1993/100; ones(620,31)];                           % actual tariff vector   
taup=[1+tau2005/100; ones(620,31)];                          % counterfactual tariff vector
tau_hat=taup./tau;                                           % Change in tariffs 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Effects of tariff changes 1993 - 2005 only NAFTA  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear tau taup tau_hat
tau1993=importdata('tariffs1993.txt');                       % tariffs 1993  
tau2005=importdata('tariffs2005.txt');                       % tariffs 2005
tau=[1+tau1993/100; ones(620,31)];                           % actual tariff vector   
taupdata=[1+tau2005/100; ones(620,31)];                      % counterfactual tariff vector
taup = tau;

for i=1:J
    taup(20+(i-1)*N,30) = taupdata(20+(i-1)*N,30);
    taup(20+(i-1)*N,5)  = taupdata(20+(i-1)*N,5);
    taup(30+(i-1)*N,20) = taupdata(30+(i-1)*N,20);
    taup(30+(i-1)*N,5)  = taupdata(30+(i-1)*N,5);
    taup(5+(i-1)*N,30)  = taupdata(5+(i-1)*N,30);
    taup(5+(i-1)*N,20)  = taupdata(5+(i-1)*N,20);
end
tau_hat = taup./tau;

[wf0_all_oN pf0_all_oN PQ_all_oN Fp_all_oN Dinp_all_oN ZW Snp_all c_all_oN] = equilibrium_LC(tau_hat,taup,alphas,T,B,G,Din,J,N,maxit,tol,VAn,Sn,vfactor); %this function solves for the equilibrium
[Welfare_all_oN ToTL_all_oN VoTL_all_oN ToTEjn_all_oN ToTMjn_all_oN VoTXjn_all_oN VotXjni_all_oN  Xjni_dc_all_oN] = Welfarelineal(PQ_all_oN,Dinp_all_oN,c_all_oN,tau,taup,xbilattau,In,J,N); %this function calculates welfare, terms of trade and trade volume effects 
P=prod(pf0_all_oN.^(alphas)); %price index
W_all_oN=wf0_all_oN./P';      %real wages

PQ_vec   = reshape(PQ_all_oN',1,J*N)'; % expenditures Xji in long vector: PQ_vec=(X11 X12 X13...)' 

%compute bilateral trade flows in the counterfactutal
Dinp_om_oN = Dinp_all_oN./taup;
xbilattau_all_oN = (PQ_vec*ones(1,N)).*Dinp_om_oN;

%compute the export flows matrices in the base year and counterfactual eq.
xbilattau_exp=zeros(J*N,N);
for j=1:J
    xbilattau_exp(1+(j-1)*N:j*N,:)=xbilattau(1+(j-1)*N:j*N,:)-diag(diag(xbilattau(1+(j-1)*N:j*N,:)));
end

xbilattau_all_exp_oN=zeros(J*N,N);
for j=1:J
    xbilattau_all_exp_oN(1+(j-1)*N:j*N,:)=xbilattau_all_oN(1+(j-1)*N:j*N,:)-diag(diag(xbilattau_all_oN(1+(j-1)*N:j*N,:)));
end

% compute total exports by country and sector in the counterfactual eq.
Ejnp=zeros(J,N);
for j=1:J
    Ejnp(j,:)=sum(xbilattau_all_exp_oN(1+(j-1)*N:j*N,:));
end
 
shareEjnp=Ejnp./(ones(J,1)*sum(Ejnp));  %export shares by sectors in the counterfactual eq.
shareEjnp_all_oN=shareEjnp;
HH_exp_allp_oN=sum(shareEjnp.*shareEjnp);
HH_exp_allp_oN=((HH_exp_allp_oN-1/J)./(1-1/J))';  %Normalized Herfindahl index of export concentration in the base year

% compute total exports by country and sector in the base year
Ejn=zeros(J,N);
for j=1:J
    Ejn(j,:)=sum(xbilattau_exp(1+(j-1)*N:j*N,:));
end
 
shareEjn=Ejn./(ones(J,1)*sum(Ejn));  %export shares by sectors in the base year
shareEjn_all_on=shareEjn;
HH_exp_all_oN=sum(shareEjn.*shareEjn);
HH_exp_all_oN=((HH_exp_all_oN-1/J)./(1-1/J))';

HHexpall_oN=[HH_exp_all_oN HH_exp_allp_oN];  %Normalized Herfindahl index of export concentration in the counterfactual eq.


%compute import growth
xbilattau_imp=zeros(N,N);

for i=1:N
    xbilattau_imp(i,:)=sum(xbilattau_exp(i:N:J*N,:));
end

xbilattau_all_imp_oN=zeros(N,N);

for i=1:N
    xbilattau_all_imp_oN(i,:)=sum(xbilattau_all_exp_oN(i:N:J*N,:));
end

gimp_all_oN=100*(xbilattau_all_imp_oN./xbilattau_imp-1); %import growth



