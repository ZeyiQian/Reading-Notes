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

tau=[1+tau1993/100; ones(620,31)];                           % actual tariff vector   
taup=[1+tau2005/100; ones(620,31)];                          % counterfactual tariff vector
taup=tau;
tau_hat=taup./tau;                                           % Change in tariffs 

% Parameters
G=importdata('IO.txt');                                      % IO coefs
B=importdata('B.txt');                                       % Share of value added


for n = 1:N
     G( 1 + (n-1)*J : J*n ,:) =  diag(diag(G( 1 + (n-1)*J : J*n ,1:J)));
     B(:,n) = 1- diag(G( 1 + (n-1)*J : J*n ,1:J));
     G( 1 + (n-1)*J : J*n ,:) =  eye(J);
end
load GO_NO_IO                                                      % Gross Output 
T=importdata('T.txt'); T=[1./T; ones(20,1)*(1/8.22)];        % Thetas - dispersion of productivity - non-tradables = 8.22
load alphas_NO_IO
% Loading trade flows
load xbilat_base_year_NO_IO
xbilat = xbilatp;

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

% Sn=zeros(N,1);
% Calculating Value Added 
VAjn=GO.*B;
VAn=sum(VAjn)';

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Main Program Counterfactuals
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
[wf0 pf0 PQ Fp Dinp ZW] = equilibrium_LC(tau_hat,taup,alphas,T,B,G,Din,J,N,maxit,tol,VAn./100000,Sn./100000,vfactor);

PQ_vec   = reshape(PQ',1,J*N)'; % expenditures Xji in long vector: PQ_vec=(X11 X12 X13...)' 
Dinp_om = Dinp./taup;
xbilattau = (PQ_vec*ones(1,N)).*Dinp_om;
xbilatp = xbilattau.*taup;

for j=1:J
    GO(j,:) = sum(xbilattau(1+(j-1)*N : j*N,:));
end

for j=1:J
    for n = 1:N
        xbilatp(n+(j-1)*N,n) = 0;
    end   
end

for j   = 1:1:J
irow    = 1+N*(j-1):1:N*j;
F(j,:) = sum((Din(irow,:)./tau(irow,:))');
end

save('xbilat_base_zeroS_NO_IO', 'xbilatp','Dinp','xbilattau')
save('alphas_NO_IO', 'alphas')
save('GO_zeroS_NO_IO', 'GO')

