% This program computes the counterfactual results displayed in Table 2 through Table 10, Table A.3, and Table A.8 through Table A.13

%Welfare and trade effects from NAFTA's tariff reductions
    welfare_stats(ToTL_all_oN,VoTL_all_oN,ToTEjn_all_oN,...
    ToTMjn_all_oN,VoTXjn_all_oN,VotXjni_all_oN,Xjni_dc_all_oN,W_all_oN,In,...
    HH_exp_all, HH_exp_allp,HH_exp_allp_oN, HH_exp_allp_extra, shareEjn_all, shareEjnp_all_oN, gimp_all_oN);   

% Welfare and trade effects from world's tariff reductions   
     welfare_stats_all(ToTL_all,VoTL_all,ToTEjn_all,...
     ToTMjn_all,VoTXjn_all,VotXjni_all,Xjni_dc_all,W_all,In, shareEjn_all, shareEjnp_all, gimp_all)

 % Welfare and trade effects from NAFTA given world's tariff reductions   
     welfare_stats_extra(ToTL_all,VoTL_all,ToTEjn_all,...
     ToTMjn_all,VoTXjn_all,VotXjni_all,Xjni_dc_all,W_all,ToTL_all_nN,VoTL_all_nN,ToTEjn_all_nN,...
     ToTMjn_all_nN,VoTXjn_all_nN,VotXjni_all_nN,Xjni_dc_all_nN,W_all_nN,In, shareEjn_all, shareEjnp_all_extra, gimp_all_extra,HH_exp_allp_extra,HH_exp_all)
 

