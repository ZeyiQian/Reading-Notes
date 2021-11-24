% This function calculates the bilateral matrix
function X_BILATS = xbi(N,IDProduct,IDYear,DATOS)
% DATOS should be ordered in the following way:
% first  column Reporter ID
% second column Partner ID
% third  column Year
% fourth column Product ID
% fifth  column value
X_BILATS = NaN(N*length(IDProduct),N*length(IDYear));

for e = 1:1:length(IDYear);
for j = 1:1:length(IDProduct);
for i=1:1:length(DATOS);
    if DATOS(i,3) == IDYear(e);     % Year
    if DATOS(i,4) == IDProduct(j);  % Product
        for Reporter = 1:1:N
        if DATOS(i,1) == Reporter;  % Reporter
            for Partner = 1:1:N
                if Partner == Reporter
                else
                    if DATOS(i,2) == Partner;  % Partner
                        X_BILATS( N*(j-1) + Reporter, N*(e-1) + Partner) = DATOS(i,5);  
                        % Exporters as columns... what row imports from column
                    end
                end
            end
        end
        end
    end
end
end
end
end

