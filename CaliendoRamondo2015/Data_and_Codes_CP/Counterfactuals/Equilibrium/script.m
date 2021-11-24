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

% Loading trade flows
xbilat1993=importdata('xbilat1993.txt'); 
xbilat1993=xbilat1993*1000;                                  % converted to dollars from thousand dollars
xbilat1993_new=[xbilat1993;zeros(20*N,N)];                   % adding the non-tradabble sectors    

tau1993=importdata('tariffs1993.txt');                       % tariffs 1993  
tau2005=importdata('tariffs2005.txt');                       % tariffs 2005

tau=[1+tau1993/100; ones(620,31)];                           % actual tariff vector   
taup=[1+tau2005/100; ones(620,31)];                          % counterfactual tariff vector
taup=tau;
tau_hat=taup./tau;                                           % Change in tariffs 

% Parameters
G=importdata('IO.txt');                                      % IO coefs
B=importdata('B.txt');                                       % Share of value added
GO=importdata('GO.txt');                                     % Gross Output 
T=importdata('T.txt'); T=[1./T; ones(20,1)*(1/8.22)];        % Thetas - dispersion of productivity - non-tradables = 8.22

% calculating expenditures
xbilat=xbilat1993_new.*tau;                         

% Domestic sales
x=zeros(J,N);
xbilat_domestic=xbilat./tau;         
for i=1:J
x(i,:)=sum(xbilat_domestic(1+(i-1)*N:i*N,:));
end
GO=max(GO,x); domsales=GO-x;                                              % Domestic sales

% Bilateral trade matrix
domsales_aux=domsales';
aux2=zeros(J*N,N);
for i=1:J
     aux2(1+(i-1)*N:i*N,:)=diag(domsales_aux(:,i));
end
xbilat=aux2+xbilat;

% Calculating X0 Expenditure
A=sum(xbilat');
for j      = 1:1:J
    X0(j,:) = A(:,1+N*(j-1):N*j);
end

% Calculating Expenditure shares
Xjn = sum(xbilat')'*ones(1,N);
Din=xbilat./Xjn;

% Calculating superavits
xbilattau=xbilat./tau;
for j      = 1:1:J
    % Imports
    M(j,:) = (sum(xbilattau(1+N*(j-1):N*j,:)'))';
    for n  = 1:1:N
    % Exports
    E(j,n) = sum(xbilattau(1+N*(j-1):N*j,n))';
    end
end;

Sn=sum(E)'-sum(M)';

% Calculating Value Added 
VAjn=GO.*B;
VAn=sum(VAjn)';

 for n=1:N
    irow=1+J*(n-1):J*n;
    num(:,n)=X0(:,n)-G(irow,:)*((1-B(:,n)).*E(:,n));
end

for j   = 1:1:J
irow    = 1+N*(j-1):1:N*j;
F(j,:) = sum((Din(irow,:)./tau(irow,:))');
end

alphas=num./(ones(J,1)*(VAn+sum(X0.*(1-F))'-Sn)');
 
for j=1:J
    for n=1:N
        if alphas(j,n)<0
            alphas(j,n)=0;
        end
    end
end
alphas=alphas./(ones(J,1)*(sum(alphas)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Main Program Counterfactuals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sn=zeros(N,1);
[wf0 pf0 PQ Fp Dinp ZW Snp2] = equilibrium_LC(tau_hat,taup,alphas,T,B,G,Din,J,N,maxit,tol,VAn./100000,Sn./100000,vfactor);

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

save('xbilat_base_year', 'xbilatp','Dinp','xbilattau')
save('alphas', 'alphas')
save('GO', 'GO')

