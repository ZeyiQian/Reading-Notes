function [] = welfare_stats_with_deficit(ToTL_all_oN,VoTL_all_oN,ToTEjn_all_oN,...
    ToTMjn_all_oN,VoTXjn_all_oN,VotXjni_all_oN,Xjni_dc_all_oN,W_all_oN,In,...
     shareEjn_all_oN, shareEjnp_all_oN, gimp_all_oN, HH_exp_allp_oN, HH_exp_all_oN)


ToTL=ToTL_all_oN; VoTL=VoTL_all_oN;
W=W_all_oN; Welfare = ToTL+VoTL; ToTEjn=ToTEjn_all_oN; ToTMjn=ToTMjn_all_oN;
VoTXjn=VoTXjn_all_oN; VotXjni=VotXjni_all_oN; Xjni_dc=Xjni_dc_all_oN;
gimp=gimp_all_oN;

sectors =[' Agriculture    ';' Mining         ';' Food           ';' Textile        ';
' Wood           ';' Paper          ';' Petroleum      ';' Chemicals      ';
' Plastic        ';' Minerals       ';' Basic metals   ';' Metal products ';
' Machinery nec  ';' Office         ';' Electrical     ';' Com            ';
' Medical        ';' Auto           ';' Other Transport';' Other          '];

countries = ['Argentina    ';'Australia    ';'Austria      ';
'Brazil       ';'Canada       ';'Chile        ';'China        ';
'Denmark      ';'Finland      ';'France       ';'Germany      ';
'Greece       ';'Hungary      ';'India        ';'Indonesia    ';
'Ireland      ';'Italy        ';'Japan        ';'Korea        ';
'Mexico       ';'Netherlands  ';'New Zealand  ';'Norway       ';
'Portugal     ';'SouthAfrica  ';'Spain        ';'Sweden       ';
'Turkey       ';'UK           ';'USA          ';'ROW          '];

pct =[ '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    ';
    '%    '];

%Mexico country 20 %Canada country 5 %USA    country 30

mex = 20; can = 5; usa = 30; N = length(countries); J = length(sectors);
% Table A.3
disp(['_________________________________________________________________'])
disp(['                           Table A.4                                       '])
disp(['Welfare effects from NAFTA tariff reductions, with trade deficit           '])
disp(['Country          Total     ToT      VoT   Real Wage'])
disp([countries(mex,:) ' = ' num2str(((Welfare(mex)))*100,3) '%    ' num2str((ToTL(mex))*100,3) '%    ' num2str((VoTL(mex))*100,3) '%      ' num2str((W(mex)-1)*100,3) '%'])
disp([countries(can,:) ' = ' num2str(((Welfare(can)))*100,2) '% ' num2str((ToTL(can))*100,2) '%    ' num2str((VoTL(can))*100,2) '%     ' num2str((W(can)-1)*100,2) '%'])
disp([countries(usa,:) ' = ' num2str(((Welfare(usa)))*100,2) '%  ' num2str((ToTL(usa))*100,2) '%    ' num2str((VoTL(usa))*100,2) '%     ' num2str((W(usa)-1)*100,2) '%'])
disp(['_________________________________________________________________'])

nafta = [can mex usa];
for n = nafta
    for   j =  1:1:J
    VoTXnafta(j,n) = nansum(VotXjni(n + N*(j-1) , nafta));
    ToTEjnafta(j,n) = sum(Xjni_dc( nafta + N*(j-1) ,n));
    ToTMjnafta(j,n) = sum(Xjni_dc(n + N*(j-1) , nafta));
    end
end

VOTN_aux = sum(VoTXnafta);
VOTN = VOTN_aux(nafta)./In(nafta)';
VOTROW = VoTL(nafta)' - VOTN; 
TOTN= (sum(ToTEjnafta(:,nafta))-sum(ToTMjnafta(:,nafta)))./In(nafta)';
TOTROW = ToTL(nafta)' - TOTN; 

% Table A.5
disp(['_________________________________________________________________'])
disp(['                           Table A.5                                       '])
disp(['Bilateral welfare effects from NAFTA tariff reductions, with trade deficit '])
disp(['                       TOT              VOT                                '])
disp(['Country          NAFTA    ROW      NAFTA   ROW'])
disp([countries(mex,:) ' = ' num2str(((TOTN(2)))*100,3) '%    ' num2str(((TOTROW(2)))*100,3) '%    ' num2str(((VOTN(2)))*100,3) '%    ' num2str(((VOTROW(2)))*100,3) '%'])
disp([countries(can,:) ' = ' num2str(((TOTN(1)))*100,2) '%    ' num2str(((TOTROW(1)))*100,2) '%    ' num2str(((VOTN(1)))*100,2) '%    ' num2str(((VOTROW(1)))*100,2) '%'])
disp([countries(usa,:) ' = ' num2str(((TOTN(3)))*100,2) '%    ' num2str(((TOTROW(3)))*100,2) '%    ' num2str(((VOTN(3)))*100,2) '%    ' num2str(((VOTROW(3)))*100,2) '%'])
disp(['_________________________________________________________________'])

% Table A.6
disp(['_________________________________________________________________'])
disp(['                           Table A.6                                       '])
disp(['Sectoral contribution to welfare effects from NAFTA tariff reductions, with trade deficit'])
disp(['                      Mexico           Canada          United States       '])
disp(['Sectors            ToT     VoT      ToT      VoT        ToT     VoT        '])
disp([sectors  num2str(((ToTEjn(1:20,mex)-ToTMjn(1:20,mex))./nansum((ToTEjn(1:20,mex)-ToTMjn(1:20,mex))))*100,3) pct(:,1:3)...
    num2str((( VoTXjn(1:20,mex))./nansum(( VoTXjn(1:20,mex))))*100,3) pct(:,1:3)...
    num2str(((ToTEjn(1:20,can)-ToTMjn(1:20,can))./nansum((ToTEjn(1:20,can)-ToTMjn(1:20,can))))*100,3) pct(:,1:3)...
    num2str((( VoTXjn(1:20,can))./nansum(( VoTXjn(1:20,can))))*100,3) pct(:,1:5)...
    num2str(((ToTEjn(1:20,usa)-ToTMjn(1:20,usa))./nansum((ToTEjn(1:20,usa)-ToTMjn(1:20,usa))))*100,3) pct(:,1:3)...
    num2str((( VoTXjn(1:20,usa))./nansum(( VoTXjn(1:20,usa))))*100,3) pct(:,1:3)])
disp(['_________________________________________________________________'])



% Table A.7
disp(['_________________________________________________________________'])
disp(['                             Table A.7                                       '])
disp(['Sectoral composition of exports, with trade deficit                        '])
disp(['                      Mexico           Canada        United States         '])
disp(['Sectors         Before     After  Before   After    Before   After      '])
disp([sectors  num2str(shareEjn_all_oN(1:20,mex)*100,3) pct(:,1:3)...
    num2str(shareEjnp_all_oN(1:20,mex)*100,3) pct(:,1:3)...
    num2str(shareEjn_all_oN(1:20,can)*100,3) pct(:,1:3)...
    num2str(shareEjnp_all_oN(1:20,can)*100,3) pct(:,1:3)...
    num2str(shareEjn_all_oN(1:20,usa)*100,3) pct(:,1:3)...
    num2str(shareEjnp_all_oN(1:20,usa)*100,3) pct(:,1:3)])
disp(['_________________________________________________________________'])
disp(['_________________________________________________________________'])
disp(['             Herfindalh Index of Exports Concentration'])                                      
disp(['Country       Before     After                        '])
disp([countries(mex,:) ' = ' num2str(((HH_exp_all_oN(mex))),3) '   ' num2str((HH_exp_allp_oN(mex)),3) '       '])
disp([countries(can,:) ' = ' num2str(((HH_exp_all_oN(can))),2) '   ' num2str((HH_exp_allp_oN(can)),2) '       '])
disp([countries(usa,:) ' = ' num2str(((HH_exp_all_oN(usa))),2) '   ' num2str((HH_exp_allp_oN(usa)),2) '       '])
disp(['_________________________________________________________________'])

