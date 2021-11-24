% Script

close all
clear all
clc

vfactor  = -0.2;
tol      = 1E-07;
maxit    = 1E+10;

%Inputs
J=40; N=31;

% Countries = [Argentina    Australia   Austria Brazil  Canada  Chile China   Denmark Finland France...
%              Germany  Greece  Hungary India   Indonesia   Ireland Italy   Japan   Korea Mexico ...
%              Netherlands New Zealand Norway  Portugal    SouthAfrica Spain   Sweden  Turkey  UK   USA ...
%              ROW];

tau1993=importdata('tariffs1993.txt');                       % tariffs 1993  
 tau2005=importdata('tariffs2005.txt');                       % tariffs 2005

 tau1993_v2=zeros(N,N);
 for i=1:N
    tau1993_v2(i,:)=median(tau1993(i:N:20*N,:));
 end

tau2005_v2=zeros(N,N);
 for i=1:N
    tau2005_v2(i,:)=median(tau2005(i:N:20*N,:));
 end
tau1993=tau1993_v2;                                       %aggregate tariffs 1993
tau2005=tau2005_v2;                                       %aggregate tariffs 2005
 % 
 tau=[1+tau1993/100;ones(N,N)];                           % actual tariff vector   
 taup=[1+tau2005/100;ones(N,N)];                          % counterfactual tariff vector
 taup=tau;
 tau_hat=taup./tau;        
 
% Parameters
G=importdata('IO.txt');    % IO coefs
   
 G_aux_T=zeros(N*J,1);
 G_aux_NT=zeros(N*J,1);
   for j=1:N*J
  G_auxT(j,:)=mean(G(j,1:20));
   end
  for j=1:N*J
  G_auxNT(j,:)=mean(G(j,21:40));
   end
  
  G_aux=[G_auxT,G_auxNT];                                            
  
  G_aux2=zeros(2*N,2);
  for j=1:2*N
      G_aux2(j,:)=mean(G_aux(1+(j-1)*20:j*20,:));
  end
  
  G_aux3=zeros(2*N,2);
  for j=1:N
      G_aux3(1+(j-1)*2:j*2,:)=G_aux2(1+(j-1)*2:j*2,:)./(ones(2,1)*sum(G_aux2(1+(j-1)*2:j*2,:)));
  end
%   
G=G_aux3;                                                      %aggregate IO

  B=importdata('B.txt');                                       % Share of value added
   B1=median(B(1:20,:));
   B2=median(B(21:40,:));
   B=[B1;B2];
   
 load GO_zeroS;                                                  

 T=1/4.55*ones(2,1);                                       % Thetas - dispersion of productivity 
load alphas

% Loading trade flows
load xbilat_base_zeroS 
xbilat = xbilatp;

J=2;

% Domestic sales
x=zeros(J,N);
xbilat_domestic=xbilat./tau;         
for i=1:J
x(i,:)=sum(xbilat_domestic(1+(i-1)*N:i*N,:));
end
GO=max(GO,x); domsales=GO-x;                                 % Domestic sales

% Bilateral trade matrix
domsales_aux=domsales';
aux2=zeros(J*N,N);
for i=1:J
     aux2(1+(i-1)*N:i*N,:)=diag(domsales_aux(:,i));
end
xbilat=aux2+xbilat;

% Calculating Expenditure shares
Xjn = sum(xbilat')'*ones(1,N);
Din=xbilat./Xjn;

% Calculating superavits
xbilattau=xbilat./tau;

%Calculating X0 Expenditure
A=sum(xbilat');
for j      = 1:1:J
    X0(j,:) = A(:,1+N*(j-1):N*j);
end

for j      = 1:1:J
    % Imports
    M(j,:) = (sum(xbilattau(1+N*(j-1):N*j,:)'))';
    for n  = 1:1:N
    % Exports
    E(j,n) = sum(xbilattau(1+N*(j-1):N*j,n))';
    end
end

Sn=sum(E)'-sum(M)';
Sn = Sn*0;

% Calculating Value Added 
VAjn=GO.*B;
VAn=sum(VAjn)';

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Main Program Counterfactuals
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
[wf0 pf0 PQ Fp Dinp ZW] = equilibrium_LC(tau_hat,taup,alphas,T,B,G,Din,J,N,maxit,tol,VAn./100000,Sn./100000,vfactor);

for j   = 1:1:J
irow    = 1+N*(j-1):1:N*j;
F(j,:) = sum((Din(irow,:)./tau(irow,:))');
end

save('initial_condition_1993AGG_noS','alphas','T','B','G','Din','J','N','VAn','Sn','X0','F','M','E','xbilattau','tau')



