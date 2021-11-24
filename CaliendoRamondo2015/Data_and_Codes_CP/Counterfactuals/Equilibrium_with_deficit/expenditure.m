% This function calculates de Omega matrix in Caliendo - Parro (2009)
% Inputs are A = alphas, B = bethas, G = I-O matrix, Dinp = trade shares,
% tarifap = tarifs, Fp = trade weighted tariffs

function [PQ] = expenditure(alphas,B,G,Dinp,taup,Fp,VAn,wf0,Sn,J,N)

% [J N] = size(A);
IA  = zeros(J*N,J*N);
I_F = 1 - Fp;
for n = 1:1:N
    IA(1 + (n-1)*J : n*J, 1 + (n-1)*J : n*J) = kron(alphas(:,n),I_F(:,n)');
end

Pit = Dinp./(taup);
Bt  = 1-B;
BP  = zeros(size(Pit));
for j = 1:1:J
    BP(1 + (j-1)*N:j*N, :) = kron(ones(N,1),Bt(j,:)).*Pit(1 + (j-1)*N:j*N, :);
end

NBP = zeros(size(BP'));

for j = 1:1:N
    for n = 1:1:N
        NBP(j , 1 + (n-1)*J : n*J) = BP([n:N:J*N], j);
    end
end

NNBP = kron(NBP,ones(J,1));
GG   = kron(ones(1,N),G);
GP = GG.*NNBP;

OM = eye(J*N,J*N) - (GP + IA); 
Vb =    alphas.*kron(ones(J,1),(wf0.*VAn)');
Vb = reshape(Vb,J*N,1);
Bb =  -alphas.*((Sn)*ones(1,J))';
Bb = reshape(Bb,J*N,1);

DD1 = (OM^-1)*Vb;
DD2 = (OM^-1)*Bb;
PQ =  DD1 + DD2;
PQ = reshape(PQ,J,N);

