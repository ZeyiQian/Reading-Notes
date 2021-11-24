% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Main Program to run counterfactuals without trade deficits
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all
clc

vfactor  = -0.2;    %adjustment factor
tol      = 1E-07;   %tolerance
maxit    = 1E+10;   %max number of 

load initial_condition_1993_noS 

In = (VAn+sum(X0.*(1-F))'-Sn);                               % total income
tau1993=importdata('tariffs1993.txt');                       % tariffs 1993  
tau2005=importdata('tariffs2005.txt');                       % tariffs 2005
tau=[1+tau1993/100; ones(620,31)];                           % actual tariff vector   
taup=[1+tau2005/100; ones(620,31)];                          % counterfactual tariff vector
tau_hat=taup./tau;                                           % Change in tariffs 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Effects of tariff changes 1993 - 2005   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
[wf0_all pf0_all PQ_all Fp_all Dinp_all ZW  Snp_all c_all] = equilibrium_LC(tau_hat,taup,alphas,T,B,G,Din,J,N,maxit,tol,VAn,Sn,vfactor);  %this function solves for the equilibrium
[Welfare_all ToTL_all VoTL_all ToTEjn_all ToTMjn_all VoTXjn_all VotXjni_all Xjni_dc_all] = Welfarelineal(PQ_all,Dinp_all,c_all,tau,taup,xbilattau,In,J,N);   %this function calculates welfare, terms of trade and trade volume effects 
P=prod(pf0_all.^(alphas)); %price index
W_all=wf0_all./P';         %real wages   

PQ_vec   = reshape(PQ_all',1,J*N)';          % expenditures Xji in long vector: PQ_vec=(X11 X12 X13...)' 

%compute bilateral trade flows in the counterfactutal
Dinp_om = Dinp_all./taup;                       
xbilattau_all = (PQ_vec*ones(1,N)).*Dinp_om; 

%compute the export flows matrices in the base year and counterfactual eq.
xbilattau_exp=zeros(J*N,N);
for j=1:J
    xbilattau_exp(1+(j-1)*N:j*N,:)=xbilattau(1+(j-1)*N:j*N,:)-diag(diag(xbilattau(1+(j-1)*N:j*N,:)));
end

xbilattau_all_exp=zeros(J*N,N);
for j=1:J
    xbilattau_all_exp(1+(j-1)*N:j*N,:)=xbilattau_all(1+(j-1)*N:j*N,:)-diag(diag(xbilattau_all(1+(j-1)*N:j*N,:)));
end

%compute total exports by country and sector in the counterfactual eq.
Ejnp=zeros(J,N);
for j=1:J
    Ejnp(j,:)=sum(xbilattau_all_exp(1+(j-1)*N:j*N,:));
end
 
shareEjnp=Ejnp./(ones(J,1)*sum(Ejnp)); %export shares by sectors in the counterfactual eq.
shareEjnp_all=shareEjnp;
HH_exp_allp=sum(shareEjnp.*shareEjnp);
HH_exp_allp=((HH_exp_allp-1/J)./(1-1/J))';  %Normalized Herfindahl index of export concentration in the counterfactual equilibrium

%compute total exports by country and sector in the base year
Ejn=zeros(J,N);
for j=1:J
    Ejn(j,:)=sum(xbilattau_exp(1+(j-1)*N:j*N,:));
end
 
shareEjn=Ejn./(ones(J,1)*sum(Ejn)); %export shares by sectors in the base year
shareEjn_all=shareEjn;
HH_exp_all=sum(shareEjn.*shareEjn);
HH_exp_all=((HH_exp_all-1/J)./(1-1/J))'; %Normalized Herfindahl index of export concentration in the base year

%compute import growth
xbilattau_imp=zeros(N,N);

for i=1:N
    xbilattau_imp(i,:)=sum(xbilattau_exp(i:N:J*N,:));
end

xbilattau_all_imp=zeros(N,N);

for i=1:N
    xbilattau_all_imp(i,:)=sum(xbilattau_all_exp(i:N:J*N,:));
end

gimp_all=100*(xbilattau_all_imp./xbilattau_imp-1); %import growth


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Effects of tariff changes 1993 - 2005 without NAFTA  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear tau taup tau_hat
tau1993=importdata('tariffs1993.txt');                       % tariffs 1993  
tau2005=importdata('tariffs2005.txt');                       % tariffs 2005
tau=[1+tau1993/100; ones(620,31)];                           % actual tariff vector   
taup=[1+tau2005/100; ones(620,31)];                          % counterfactual tariff vector

for i=1:J
    taup(20+(i-1)*N,30) = tau(20+(i-1)*N,30);
    taup(20+(i-1)*N,5)  = tau(20+(i-1)*N,5);
    taup(30+(i-1)*N,20) = tau(30+(i-1)*N,20);
    taup(30+(i-1)*N,5)  = tau(30+(i-1)*N,5);
    taup(5+(i-1)*N,30)  = tau(5+(i-1)*N,30);
    taup(5+(i-1)*N,20)  = tau(5+(i-1)*N,20);
end
tau_hat = taup./tau;

[wf0_all_nN pf0_all_nN PQ_all_nN Fp_all_nN Dinp_all_nN ZW Snp_all c_all_nN] = equilibrium_LC(tau_hat,taup,alphas,T,B,G,Din,J,N,maxit,tol,VAn,Sn,vfactor); %this function solves for the equilibrium
[Welfare_all_nN ToTL_all_nN VoTL_all_nN ToTEjn_all_nN ToTMjn_all_nN VoTXjn_all_nN VotXjni_all_nN  Xjni_dc_all_nN] = Welfarelineal(PQ_all_nN,Dinp_all_nN,c_all_nN,tau,taup,xbilattau,In,J,N); %this function calcultes welfare, terms of trade and trade volume effects 
P=prod(pf0_all_nN.^(alphas)); %price index
W_all_nN=wf0_all_nN./P';      %real wages

PQ_vec   = reshape(PQ_all_nN',1,J*N)'; % expenditures Xji in long vector: PQ_vec=(X11 X12 X13...)' 

%compute bilateral trade flows in the counterfactutal
Dinp_om_nN = Dinp_all_nN./taup;
xbilattau_all_nN = (PQ_vec*ones(1,N)).*Dinp_om_nN;

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
[Welfare_all_oN ToTL_all_oN VoTL_all_oN ToTEjn_all_oN ToTMjn_all_oN VoTXjn_all_oN VotXjni_all_oN  Xjni_dc_all_oN] = Welfarelineal(PQ_all_oN,Dinp_all_oN,c_all_oN,tau,taup,xbilattau,In,J,N); %this function calcultes welfare, terms of trade and trade volume effects 
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trade effects given world's tariff reductions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%compute export flow matrices in the counterfactual eq., given world's tariff reductions
Ejnp=zeros(J,N);
g_all_extra=(xbilattau_all./xbilattau_all_nN);
g_all_extra(isnan(g_all_extra)) = 1;
xbilattau_all_extra=(g_all_extra).*xbilattau;

xbilattau_exp=zeros(J*N,N);
for j=1:J
    xbilattau_exp(1+(j-1)*N:j*N,:)=xbilattau(1+(j-1)*N:j*N,:)-diag(diag(xbilattau(1+(j-1)*N:j*N,:)));
end

xbilattau_all_exp_extra=zeros(J*N,N);
for j=1:J
    xbilattau_all_exp_extra(1+(j-1)*N:j*N,:)=xbilattau_all_extra(1+(j-1)*N:j*N,:)-diag(diag(xbilattau_all_extra(1+(j-1)*N:j*N,:)));
end

% compute total exports by country and sector in the counterfactual eq,given world's tariff reductions
Ejnp=zeros(J,N);
for j=1:J
    Ejnp(j,:)=nansum(xbilattau_all_exp_extra(1+(j-1)*N:j*N,:));
end
 
shareEjnp=Ejnp./(ones(J,1)*sum(Ejnp)); %export shares by sectors in the counterfactual eq., given world's tariff reductions 
shareEjnp_all_extra=shareEjnp;
HH_exp_allp_extra=nansum(shareEjnp.*shareEjnp);
HH_exp_allp_extra=((HH_exp_allp_extra-1/J)./(1-1/J))'; %Normalized Herfindahl index of export concentration in the counterfactual eq., given world's tariff reductions 

% compute total exports by country and sector in the cbase year,given world's tariff reductions
Ejn=zeros(J,N);
for j=1:J
    Ejn(j,:)=nansum(xbilattau_exp(1+(j-1)*N:j*N,:));
end
 
shareEjn=Ejn./(ones(J,1)*sum(Ejn)); %export shares by sectors in the cbase year, given world's tariff reductions 
shareEjn_all_extra=shareEjn;
HH_exp_all_extra=nansum(shareEjn.*shareEjn);
HH_exp_all_extra=((HH_exp_all_extra-1/J)./(1-1/J))';

HHexpall_extra=[HH_exp_all_extra HH_exp_allp_extra]; %Normalized Herfindahl index of export concentration in the base year, given world's tariff reductions 


%compute import growth, given world's tariff reductions
xbilattau_imp=zeros(N,N);

for i=1:N
    xbilattau_imp(i,:)=sum(xbilattau_exp(i:N:J*N,:));
end

xbilattau_all_imp_extra=zeros(N,N);

for i=1:N
    xbilattau_all_imp_extra(i,:)=sum(xbilattau_all_exp_extra(i:N:J*N,:));
end

gimp_all_extra=100*(xbilattau_all_imp_extra./xbilattau_imp-1); %import growth, given NAFTA's tariff reductions

