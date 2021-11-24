function [lnX lnY y_t y_t1 x_t x_t1 X_t Y_t] = CP_stat(T_93,T_05,X_BILATS93,X_BILATS05,N)
   
X_t = []; Y_t = [];
X_t1 = []; Y_t1 = [];
for i = 1 : 1 : N - 2 % from i - > j
    for j = i + 1 : 1 : N - 1  % from j - > n
        for n = j + 1 : 1 : N  % from n - > i
            if j == 4 & n == 20
           X_t  = [X_t;  NaN];
           Y_t  = [Y_t;  NaN];
           X_t1 = [X_t1; NaN];
           Y_t1 = [Y_t1; NaN];

            else
           X_t  = [X_t;  T_93(i,j)*T_93(j,n)*T_93(n,i)/(T_93(j,i)*T_93(n,j)*T_93(i,n))];
           Y_t  = [Y_t;  X_BILATS93(i,j)*X_BILATS93(j,n)*X_BILATS93(n,i)/(X_BILATS93(j,i)*X_BILATS93(n,j)*X_BILATS93(i,n))];
           X_t1 = [X_t1; T_05(i,j)*T_05(j,n)*T_05(n,i)/(T_05(j,i)*T_05(n,j)*T_05(i,n))];
           Y_t1 = [Y_t1; X_BILATS05(i,j)*X_BILATS05(j,n)*X_BILATS05(n,i)/(X_BILATS05(j,i)*X_BILATS05(n,j)*X_BILATS05(i,n))];
            end
       end
   end
end
lnX = log(X_t1./X_t);
lnY = log(Y_t1./Y_t);
y_t = log(Y_t);
x_t = log(X_t);
y_t1 = log(Y_t1);
x_t1 = log(X_t1);






