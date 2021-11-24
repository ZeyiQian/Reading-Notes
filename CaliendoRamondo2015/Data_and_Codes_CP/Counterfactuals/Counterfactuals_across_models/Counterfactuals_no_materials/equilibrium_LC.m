% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%  Main Program Counterfactuals
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [wf0 pf0 PQ Fp Dinp ZW Snp c DP PF] = equilibrium_LC(tau_hat,taup,alphas,T,B,G,Din,J,N,maxit,tol,VAn,Sn,vfactor)

% initialize vectors of ex-post wage and price factors 
 wf0      =  ones(N,1);  pf0      =  ones(J,N);

 wfmax = 1; e = 1;
while (e <= maxit) && (wfmax > tol);

[pf0 c] = PH(wf0,tau_hat,T,B,G,Din,J,N,maxit,tol);
       
% Calculating trade shares
Dinp = Dinprime(Din,tau_hat,c,T,J,N);
Dinp_om = Dinp./taup;

for j   = 1:1:J
irow    = 1+N*(j-1):1:N*j;
Fp(j,:) = sum((Dinp(irow,:)./taup(irow,:))');
end
 
% % Expenditure MATRIX
PQ = expenditure(alphas,B,G,Dinp,taup,Fp,VAn,wf0,Sn,J,N);

% Iterating using LMC
wf1 =LMC(PQ, Dinp_om, J,N,B,VAn);

%Excess function
ZW = (wf1-wf0);

PQ_vec   = reshape(PQ',1,J*N)'; % expenditures Xji in long vector: PQ_vec=(X11 X12 X13...)' 

for n = 1:1:N
    DP(:,n)  = Dinp_om(:,n).*PQ_vec; 
end
LHS = sum(DP)'; %exports

% calculating RHS (Imports) trade balance
PF = PQ.*Fp;
RHS = sum(PF)'; %imports

% excess function (trade balance)
Snp = (RHS - LHS + Sn);
ZW2 = -(RHS - LHS + Sn)./(VAn);
%Iteration factor prices
wf1 =wf0.*(1-vfactor*ZW2./wf0);

wfmax=sum(abs(wf1-wf0));
wfmax=sum(abs(Snp))
wfmax0 = wfmax;
wf0=(wf1);


e=e+1;
end

