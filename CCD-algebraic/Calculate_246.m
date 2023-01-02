function B = Calculate_135(Pe,Pc,Pf)
    Pe_x = Pe(1);
    Pe_y = 0;
    Pe_z = Pe(3);

    Pc_x = Pc(1);
    Pc_y = 0;
    Pc_z = Pc(3);
    
    Pf_x = Pf(1);
    Pf_y = 0;
    Pf_z = Pf(3);  

    Pec = [Pe_x-Pc_x,Pe_y-Pc_y,Pe_z-Pc_z]; Pec_x = Pec(1); Pec_y = Pec(2);  Pec_z = Pec(3);
    length_Pec = sqrt( (Pec_x)^2 + (Pec_y)^2 + (Pec_z)^2);
    Pfc = [Pf_x-Pc_x,Pf_y-Pc_y,Pf_z-Pc_z]; Pfc_x = Pfc(1); Pfc_y = Pfc(2);  Pfc_z = Pfc(3);
    length_Pfc = sqrt( (Pfc_x)^2 + (Pfc_y)^2 + (Pfc_z)^2);
    %% Tich co huong
    Z = -(Pec_z/length_Pec)*(Pfc_x/length_Pfc) + (Pec_x/length_Pec)*(Pfc_z/length_Pfc);
    %% Calculate theta
    theta = acosd((Pec_x*Pfc_x+Pec_z*Pfc_z)/(length_Pec*length_Pfc));
    Z = sign(Z);
    
    B = [theta Z];
end