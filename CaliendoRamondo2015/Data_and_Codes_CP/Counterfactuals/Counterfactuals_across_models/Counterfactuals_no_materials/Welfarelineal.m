
function [Welfare ToT VoT ToTEjn ToTMjn VoTXjn votXjni  Xjni_dc] = Welfarelineal(PQ_all,Dinp_all,c_all,tau,taup,xbilattau,In,J,N)

PQ_vec_all   = reshape(PQ_all',1,J*N)'; % expenditures Xji in long vector: PQ_vec=(X11 X12 X13...)' 
Dinp_om_all = Dinp_all./taup;
xbilattau_all = (PQ_vec_all*ones(1,N)).*Dinp_om_all;
xbilatp = xbilattau_all./xbilattau;
xbtau = xbilattau.*(tau-1);
xbtautcre = xbilattau.*(taup-1);

% xbilattau= (xbilattau_all+xbilattau)./2;
% xbtau = ((xbilattau_all+xbilattau)./2).*(((tau-1)+(taup-1))./2);


for j = 1:1:J
for n = 1:1:N
Xjni_dc(n + N*(j-1) , :) = xbilattau(n + N*(j-1) , : ).*((c_all(j,:)-1));
votXjni(n + N*(j-1) , :) = xbtau(n + N*(j-1) , : ).*((xbilatp(n + N*(j-1) , :)-1) - (c_all(j,:)-1));
xbtautcre(n + N*(j-1),n) = 0;
tcreXjni(n + N*(j-1) , :) = xbtautcre(n + N*(j-1) , : ).*((xbilatp(n + N*(j-1) , :)-1) - (c_all(j,:)-1));

end
end

for n = 1:1:N
for   j =  1:1:J
    ToTEjn(j,n) = sum(Xjni_dc(1 + N*(j-1) : N*j,n));
    ToTMjn(j,n) = sum(Xjni_dc(n + N*(j-1) , :));
    VoTXjn(j,n) = nansum(votXjni(n + N*(j-1) , :));
    tcreXjn(j,n) = nansum(tcreXjni(n + N*(j-1) , :));
end
end

ToT = (sum(ToTEjn)' - sum(ToTMjn)')./In;
VoT = (nansum(VoTXjn)')./In;
Welfare = ((ToT+VoT));
