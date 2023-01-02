function A = distance_135(Pe,Pf)
    Pe_x = Pe(1);
    Pe_y = Pe(2);
    Pe_z = 0;

    Pf_x = Pf(1);
    Pf_y = Pf(2);
    Pf_z = 0;    
    
    A = sqrt( (Pf_x-Pe_x)^2 + (Pf_y-Pe_y)^2 + (Pf_z-Pe_z)^2);
end