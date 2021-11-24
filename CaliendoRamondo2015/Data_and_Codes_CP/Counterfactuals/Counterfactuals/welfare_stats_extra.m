function [] = welfare_stats_extra(ToTL_all,VoTL_all,ToTEjn_all,...
    ToTMjn_all,VoTXjn_all,VotXjni_all,Xjni_dc_all,W_all,ToTL_all_nN,VoTL_all_nN,ToTEjn_all_nN,...
    ToTMjn_all_nN,VoTXjn_all_nN,VotXjni_all_nN,Xjni_dc_all_nN,W_all_nN,In, shareEjn_all, shareEjnp_all_extra, gimp_all_extra, HH_exp_allp_extra,HH_exp_all)

ToTL=(1+ToTL_all)./(1+ToTL_all_nN)-1; VoTL=(1+VoTL_all)./(1+VoTL_all_nN)-1;
W=W_all./W_all_nN; Welfare = ToTL+VoTL; ToTEjn=(1+ToTEjn_all)./(1+ToTEjn_all_nN)-1; ToTMjn=(1+ToTMjn_all)./(1+ToTMjn_all_nN)-1;
VoTXjn=(1+VoTXjn_all)./(1+VoTXjn_all_nN)-1; VotXjni=(1+VotXjni_all)./(1+VotXjni_all_nN)-1; Xjni_dc=(1+Xjni_dc_all)./(1+Xjni_dc_all_nN)-1;
gimp=gimp_all_extra;

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
% Table 9
disp(['_________________________________________________________________'])
disp(['                             Table 9                                       '])
disp(['Welfare effects from NAFTA given world tariff changes                      '])
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

% Table 10
disp(['_________________________________________________________________'])
disp(['                             Table 10                                       '])
disp(['Bilateral welfare effects from NAFTA given world tariff changes             '])
disp(['             TOT                VOT                                       '])
disp(['Country          NAFTA    ROW      NAFTA   ROW'])
disp([countries(mex,:) ' = ' num2str(((TOTN(2)))*100,3) '%    ' num2str(((TOTROW(2)))*100,3) '%    ' num2str(((VOTN(2)))*100,3) '%    ' num2str(((VOTROW(2)))*100,3) '%'])
disp([countries(can,:) ' = ' num2str(((TOTN(1)))*100,2) '%    ' num2str(((TOTROW(1)))*100,2) '%    ' num2str(((VOTN(1)))*100,2) '%    ' num2str(((VOTROW(1)))*100,2) '%'])
disp([countries(usa,:) ' = ' num2str(((TOTN(3)))*100,2) '%    ' num2str(((TOTROW(3)))*100,2) '%    ' num2str(((VOTN(3)))*100,2) '%    ' num2str(((VOTROW(3)))*100,2) '%'])
disp(['_________________________________________________________________'])

% Table A.10
disp(['_________________________________________________________________'])
disp(['                           Table A.10                                       '])
disp(['         Welfare effects from NAFTA given world tariff reductions          '])
disp(['Countries           ToT     VoT      ToT         '])
disp([countries(1,:) ' = ' num2str(((Welfare(1)))*100,3) '%    ' num2str((ToTL(1))*100,3) '%    ' num2str((VoTL(1))*100,3) '%    '      ])
disp([countries(2,:) ' = ' num2str(((Welfare(2)))*100,3) '%    ' num2str((ToTL(2))*100,3) '%    ' num2str((VoTL(2))*100,3) '%    '      ])
disp([countries(3,:) ' = ' num2str(((Welfare(3)))*100,3) '%    ' num2str((ToTL(3))*100,3) '%    ' num2str((VoTL(3))*100,3) '%    '      ])
disp([countries(4,:) ' = ' num2str(((Welfare(4)))*100,3) '%    ' num2str((ToTL(4))*100,3) '%    ' num2str((VoTL(4))*100,3) '%    '      ])
disp([countries(5,:) ' = ' num2str(((Welfare(5)))*100,3) '%    ' num2str((ToTL(5))*100,3) '%    ' num2str((VoTL(5))*100,3) '%    '      ])
disp([countries(6,:) ' = ' num2str(((Welfare(6)))*100,3) '%    ' num2str((ToTL(6))*100,3) '%    ' num2str((VoTL(6))*100,3) '%    '      ])
disp([countries(7,:) ' = ' num2str(((Welfare(7)))*100,3) '%    ' num2str((ToTL(7))*100,3) '%    ' num2str((VoTL(7))*100,3) '%    '      ])
disp([countries(8,:) ' = ' num2str(((Welfare(8)))*100,3) '%    ' num2str((ToTL(8))*100,3) '%    ' num2str((VoTL(8))*100,3) '%    '      ])
disp([countries(9,:) ' = ' num2str(((Welfare(9)))*100,3) '%    ' num2str((ToTL(9))*100,3) '%    ' num2str((VoTL(9))*100,3) '%    '      ])
disp([countries(10,:) ' = ' num2str(((Welfare(10)))*100,3) '%    ' num2str((ToTL(10))*100,3) '%    ' num2str((VoTL(10))*100,3) '%    '      ])
disp([countries(11,:) ' = ' num2str(((Welfare(11)))*100,3) '%    ' num2str((ToTL(11))*100,3) '%    ' num2str((VoTL(11))*100,3) '%    '      ])
disp([countries(12,:) ' = ' num2str(((Welfare(12)))*100,3) '%    ' num2str((ToTL(12))*100,3) '%    ' num2str((VoTL(12))*100,3) '%    '      ])
disp([countries(13,:) ' = ' num2str(((Welfare(13)))*100,3) '%    ' num2str((ToTL(13))*100,3) '%    ' num2str((VoTL(13))*100,3) '%    '      ])
disp([countries(14,:) ' = ' num2str(((Welfare(14)))*100,3) '%    ' num2str((ToTL(14))*100,3) '%    ' num2str((VoTL(14))*100,3) '%    '      ])
disp([countries(15,:) ' = ' num2str(((Welfare(15)))*100,3) '%    ' num2str((ToTL(15))*100,3) '%    ' num2str((VoTL(15))*100,3) '%    '      ])
disp([countries(16,:) ' = ' num2str(((Welfare(16)))*100,3) '%    ' num2str((ToTL(16))*100,3) '%    ' num2str((VoTL(16))*100,3) '%    '      ])
disp([countries(17,:) ' = ' num2str(((Welfare(17)))*100,3) '%    ' num2str((ToTL(17))*100,3) '%    ' num2str((VoTL(17))*100,3) '%    '      ])
disp([countries(18,:) ' = ' num2str(((Welfare(18)))*100,3) '%    ' num2str((ToTL(18))*100,3) '%    ' num2str((VoTL(18))*100,3) '%    '      ])
disp([countries(19,:) ' = ' num2str(((Welfare(19)))*100,3) '%    ' num2str((ToTL(19))*100,3) '%    ' num2str((VoTL(19))*100,3) '%    '      ])
disp([countries(20,:) ' = ' num2str(((Welfare(20)))*100,3) '%    ' num2str((ToTL(20))*100,3) '%    ' num2str((VoTL(20))*100,3) '%    '      ])
disp([countries(21,:) ' = ' num2str(((Welfare(21)))*100,3) '%    ' num2str((ToTL(21))*100,3) '%    ' num2str((VoTL(21))*100,3) '%    '      ])
disp([countries(22,:) ' = ' num2str(((Welfare(22)))*100,3) '%    ' num2str((ToTL(22))*100,3) '%    ' num2str((VoTL(22))*100,3) '%    '      ])
disp([countries(23,:) ' = ' num2str(((Welfare(23)))*100,3) '%    ' num2str((ToTL(23))*100,3) '%    ' num2str((VoTL(23))*100,3) '%    '      ])
disp([countries(24,:) ' = ' num2str(((Welfare(24)))*100,3) '%    ' num2str((ToTL(24))*100,3) '%    ' num2str((VoTL(24))*100,3) '%    '      ])
disp([countries(25,:) ' = ' num2str(((Welfare(25)))*100,3) '%    ' num2str((ToTL(25))*100,3) '%    ' num2str((VoTL(25))*100,3) '%    '      ])
disp([countries(26,:) ' = ' num2str(((Welfare(26)))*100,3) '%    ' num2str((ToTL(26))*100,3) '%    ' num2str((VoTL(26))*100,3) '%    '      ])
disp([countries(27,:) ' = ' num2str(((Welfare(27)))*100,3) '%    ' num2str((ToTL(27))*100,3) '%    ' num2str((VoTL(27))*100,3) '%    '      ])
disp([countries(28,:) ' = ' num2str(((Welfare(28)))*100,3) '%    ' num2str((ToTL(28))*100,3) '%    ' num2str((VoTL(28))*100,3) '%    '      ])
disp([countries(29,:) ' = ' num2str(((Welfare(29)))*100,3) '%    ' num2str((ToTL(29))*100,3) '%    ' num2str((VoTL(29))*100,3) '%    '      ])
disp([countries(30,:) ' = ' num2str(((Welfare(30)))*100,3) '%    ' num2str((ToTL(30))*100,3) '%    ' num2str((VoTL(30))*100,3) '%    '      ])
disp([countries(31,:) ' = ' num2str(((Welfare(31)))*100,3) '%    ' num2str((ToTL(31))*100,3) '%    ' num2str((VoTL(31))*100,3) '%    '      ])
disp(['_________________________________________________________________'])


% Table A.11
disp(['_________________________________________________________________'])
disp(['                          Table A.11                                          '])
disp(['Sectoral contribution to welfare effects from NAFTA given world tariff changes'])
disp(['                      Mexico           Canada          United States          '])
disp(['Sectors            ToT     VoT      ToT      VoT        ToT     VoT           '])
disp([sectors  num2str(((ToTEjn(1:20,mex)-ToTMjn(1:20,mex))./nansum((ToTEjn(1:20,mex)-ToTMjn(1:20,mex))))*100,3) pct(:,1:3)...
    num2str((( VoTXjn(1:20,mex))./nansum(( VoTXjn(1:20,mex))))*100,3) pct(:,1:3)...
    num2str(((ToTEjn(1:20,can)-ToTMjn(1:20,can))./nansum((ToTEjn(1:20,can)-ToTMjn(1:20,can))))*100,3) pct(:,1:3)...
    num2str((( VoTXjn(1:20,can))./nansum(( VoTXjn(1:20,can))))*100,3) pct(:,1:5)...
    num2str(((ToTEjn(1:20,usa)-ToTMjn(1:20,usa))./nansum((ToTEjn(1:20,usa)-ToTMjn(1:20,usa))))*100,3) pct(:,1:3)...
    num2str((( VoTXjn(1:20,usa))./nansum(( VoTXjn(1:20,usa))))*100,3) pct(:,1:3)])
disp(['_________________________________________________________________'])


% Table A.12
disp(['_________________________________________________________________'])
disp(['                          Table A.12                                       '])
disp(['Sectoral composition of exports from NAFTA given world tariff reductions   '])
disp(['                      Mexico           Canada          United States       '])
disp(['Sectors      Before   After  Before After   Before After  '])
disp([sectors  num2str(shareEjn_all(1:20,mex)*100,3) pct(:,1:3)...
    num2str(shareEjnp_all_extra(1:20,mex)*100,3) pct(:,1:3)...
    num2str(shareEjn_all(1:20,can)*100,3) pct(:,1:3)...
    num2str(shareEjnp_all_extra(1:20,can)*100,3) pct(:,1:3)...
    num2str(shareEjn_all(1:20,usa)*100,3) pct(:,1:3)...
    num2str(shareEjnp_all_extra(1:20,usa)*100,3) pct(:,1:3)])
disp(['_________________________________________________________________'])
disp(['             Herfindalh Index of Exports Concentration'])                                      
disp(['Country       Before     After                        '])
disp([countries(mex,:) ' = ' num2str(((HH_exp_all(mex))),3) '   ' num2str((HH_exp_allp_extra(mex)),3) '       '])
disp([countries(can,:) ' = ' num2str(((HH_exp_all(can))),2) '   ' num2str((HH_exp_allp_extra(can)),2) '       '])
disp([countries(usa,:) ' = ' num2str(((HH_exp_all(usa))),2) '   ' num2str((HH_exp_allp_extra(usa)),2) '       '])
disp(['_________________________________________________________________'])


% Table A.13
disp(['_________________________________________________________________'])
disp(['                           Table A.13                                       '])
disp(['       Imports growth from NAFTA given world tariff reductions              '])
disp(['Country          Mexico    Canada      U.S  '])
disp([countries(mex,:) ' = ' num2str(gimp(20,20),3) '%          ' num2str(gimp(20,5),3) '%         ' num2str(gimp(20,30),3) '%    '])
disp([countries(can,:) ' = ' num2str(gimp(5,20),2) '%           ' num2str(gimp(5,5),2) '%          ' num2str(gimp(5,30),2) '%    ' ])
disp([countries(usa,:) ' = ' num2str(gimp(30,20),2) '%          ' num2str(gimp(30,5),2) '%         ' num2str(gimp(30,30),2) '%   '])
disp(['_________________________________________________________________'])

