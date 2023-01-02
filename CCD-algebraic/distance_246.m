function A = distance_246(Pe,Pf)
    Pe_x = Pe(1);
    Pe_y = 0;
    Pe_z = Pe(3);

    Pf_x = Pf(1);
    Pf_y = 0;
    Pf_z = Pf(3);    
    
    A = sqrt( (Pf_x-Pe_x)^2 + (Pf_y-Pe_y)^2 + (Pf_z-Pe_z)^2);
end