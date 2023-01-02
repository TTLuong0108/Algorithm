function angle = Angle_2vector(A,B,C,dimension)
    xA = A(1);    
    xB = B(1);   
    xC = C(1);    
    if dimension == "XZ"
        yA = 0;
        yB = 0;
        yC = 0;
        zA = A(3);
        zB = B(3);
        zC = C(3);
    elseif dimension == "XY"
        yA = A(2);
        yB = B(2);
        yC = C(2);
        zA = 0;
        zB = 0;
        zC = 0;  
    elseif dimension == "XYZ"
        yA = A(2);
        yB = B(2);
        yC = C(2);
        zA = A(3);
        zB = B(3);
        zC = C(3); 
    end
    AB = sqrt( (xA-xB)^2 + (yA-yB)^2 + (zA-zB)^2 );
    BC = sqrt( (xB-xC)^2 + (yB-yC)^2 + (zB-zC)^2 );
    AC = sqrt( (xA-xC)^2 + (yA-yC)^2 + (zA-zC)^2 );
    angle_BAC = acosd((AB^2+AC^2-BC^2)/(2*AB*AC));
    angle_BCA = acosd((BC^2+AC^2-AB^2)/(2*BC*AC));
    angle = angle_BAC + angle_BCA;
end