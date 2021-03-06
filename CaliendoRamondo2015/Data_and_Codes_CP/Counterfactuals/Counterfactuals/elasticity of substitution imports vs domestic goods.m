% Computing elasticity of substitution imports vs domestic goods

for j = 1:1:40
 GO_all(j) = PQ_all(j,:)*Pit_all( 1 + 31*(j-1): 31*j ,30);
end

gGO = (GO_all'./GO(:,30) -1);

for j = 1:J
   xb(1+N*(j-1):N*j,:) = xbilattau(1+N*(j-1):N*j,:) - diag(diag(xbilattau(1+N*(j-1):N*j,:)));
   xb_all(1+N*(j-1):N*j,:) = xbilattau_all(1+N*(j-1):N*j,:) - diag(diag(xbilattau_all(1+N*(j-1):N*j,:)));
end

for j      = 1:1:J
    % Imports
    M_0(j,:) = (sum(xb(1+N*(j-1):N*j,:)'))';
    M_1(j,:) = (sum(xb_all(1+N*(j-1):N*j,:)'))';
    for n  = 1:1:N
    % Exports
    E_0(j,n) = sum(xb(1+N*(j-1):N*j,n))';
    E_1(j,n) = sum(xb_all(1+N*(j-1):N*j,n))';
    end
end

gM = (M_1(:,30)./M_0(:,30) -1);

elasticity_substitution = (gGO./gM).*(M_0(:,30)./GO(:,30)');


