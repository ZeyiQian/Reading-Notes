% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Main Program Counterfactuals
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all
clc

vfactor  = -0.2;
tol      = 1E-07;
maxit    = 1E+10;

load initial_condition_1993AGG_noS % 'alphas','T','B','G','Din','J','N','VAn','Sn','X0','F','M','E','xbilattau')

 In = (VAn+sum(X0.*(1-F))'-Sn);                                % Income country n

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   Effects of tariff changes 1993 - 2005 only NAFTA  %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear tau taup tau_hat

tau1993=importdata('tariffs1993.txt');                       % tariffs 1993  
 tau2005=importdata('tariffs2005.txt');                       % tariffs 2005

 tau1993_v2=zeros(N,N)
 for i=1:N
    tau1993_v2(i,:)=median(tau1993(i:N:20*N,:))
 end

tau2005_v2=zeros(N,N)
 for i=1:N
    tau2005_v2(i,:)=median(tau2005(i:N:20*N,:))
 end
tau1993=tau1993_v2;
tau2005=tau2005_v2;
 % 
 tau=[1+tau1993/100;ones(N,N)];                               % actual tariff vector   
 taupdata=[1+tau2005/100;ones(N,N)];                          % counterfactual tariff vector
 taup=tau;
 
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
[Welfare_all_oN ToTL_all_oN VoTL_all_oN ToTEjn_all_oN ToTMjn_all_oN VoTXjn_all_oN votXjni Xjni_dc_all_oN] = Welfarelineal(PQ_all_oN,Dinp_all_oN,c_all_oN,tau,taup,xbilattau,In,J,N); %this function calculates the change in welfare

PQ_vec   = reshape(PQ_all_oN',1,J*N)'; % expenditures Xji in long vector: PQ_vec=(X11 X12 X13...)' 
Dinp_om_oN = Dinp_all_oN./taup;
xbilattau_all_oN = (PQ_vec*ones(1,N)).*Dinp_om_oN;


disp(' --------------- ')
disp(' Welfare effects ')
disp(' --------------- ')
disp(' Welfare Gains from NAFTA tariff changes 1993 - 2005 (%) ')
disp('                One Sector Model                         ')
disp([' Mexico = ' num2str((Welfare_all_oN(20))*100) ' Canada = ' num2str((Welfare_all_oN(5))*100) ' USA = ' num2str((Welfare_all_oN(30))*100)])
disp(' ---------------------------------------------- ')


%Trade Effects%

%compute the export flows matrices in the base year and counterfactual eq.
xbilattau_exp=zeros(J*N,N);
for j=1:J
    xbilattau_exp(1+(j-1)*N:j*N,:)=xbilattau(1+(j-1)*N:j*N,:)-diag(diag(xbilattau(1+(j-1)*N:j*N,:)));
end

xbilattau_all_exp_oN=zeros(J*N,N);
for j=1:J
    xbilattau_all_exp_oN(1+(j-1)*N:j*N,:)=xbilattau_all_oN(1+(j-1)*N:j*N,:)-diag(diag(xbilattau_all_oN(1+(j-1)*N:j*N,:)));
end

%compute import growth
xbilattau_imp=zeros(N,N);

for i=1:N
    xbilattau_imp(i,:)=sum(xbilattau_exp(i:N:J*N,:));
end

xbilattau_all_imp_oN=zeros(N,N);

for i=1:N
    xbilattau_all_imp_oN(i,:)=sum(xbilattau_all_exp_oN(i:N:J*N,:));
end

gimp_all_oN_mex=100*((xbilattau_all_imp_oN(20,5)+xbilattau_all_imp_oN(20,30))./(xbilattau_imp(20,5)+xbilattau_imp(20,30))-1);
gimp_all_oN_can=100*((xbilattau_all_imp_oN(5,20)+xbilattau_all_imp_oN(5,30))./(xbilattau_imp(5,20)+xbilattau_imp(5,30))-1);
gimp_all_oN_us=100*((xbilattau_all_imp_oN(30,5)+xbilattau_all_imp_oN(30,20))./(xbilattau_imp(30,5)+xbilattau_imp(30,20))-1);


disp(' --------------- ')
disp(' Trade effects ')
disp(' --------------- ')
disp(' Trade effects from NAFTA tariff changes 1993 - 2005 (%) ')
disp('                One Sector Model                         ')
disp([' Mexico = ' num2str(gimp_all_oN_mex) ' Canada = ' num2str(gimp_all_oN_can) ' USA = ' num2str(gimp_all_oN_us)])
disp(' ---------------------------------------------- ')