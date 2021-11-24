function [D] = CP_statD(N)

d = 0;
for n = 1:1:N-2
   d = d + n*(n+1)/2;
end

DD = zeros(d,N);


e = 1;
for i = 1 : 1 : N - 2 % from i - > j
    for j = i + 1 : 1 : N - 1  % from j - > n
        for n = j + 1 : 1 : N  % from n - > i
            DD(e,i) =1;
            DD(e,n) =1;
            DD(e,j) =1;
            e=e+1;
       end
   end
end
D= DD;
