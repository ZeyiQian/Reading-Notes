function [wf0]=LMC(Xp, Dinp, J,N,B,VAL)

%Calculating new wages using the labor market clearing condition
PQ_vec=reshape(Xp',J*N,1);

 for n = 1:1:N
     DDinpt(:,n)  = Dinp(:,n).*PQ_vec;
 end
 
  for n=1:J;
     DDDinpt(n,:)=sum(DDinpt(1+N*(n-1):N*n,:));
  end
 
aux4=B.*DDDinpt;
aux5=sum(aux4);
aux5=aux5';
wf0=((1./VAL)).*aux5;
   
  