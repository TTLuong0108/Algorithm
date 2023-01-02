function KQ = forward_kinematic(theta1,theta2,theta3,theta4,theta5,theta6,L1,L2,L3,L4)

    T01=TransMatrix(L1,0,0,0);
    T12=TransMatrix(0 , 90,0,theta1);       %t1
    T23=TransMatrix(L2,-90,0,theta2);       %t2
    T34=TransMatrix(0 , 90,0,theta3);       %t3
    T45=TransMatrix(L3,-90,0,theta4);       %t4    
    T56=TransMatrix(0 , 90,0,theta5);       %t5
    T67=TransMatrix(L4, -90,0,theta6);       %t6

    %% T07
    T07=T01*T12*T23*T34*T45*T56*T67;
    Px=T07(1,4);
    Py=T07(2,4);
    Pz=T07(3,4);
    beta_T07 = atan2d(-T07(3,1),sqrt(T07(1,1)^2+T07(2,1)^2));
    alpha_T07 = atan2d(T07(2,1)/cosd(beta_T07),T07(1,1)/cosd(beta_T07));
    gama_T07 = atan2d(T07(3,2)/cosd(beta_T07),T07(3,3)/cosd(beta_T07));
    
    KQ_T07_frame = [Px,Py,Pz,gama_T07,beta_T07,alpha_T07] ;
    %% T05
    T05=T01*T12*T23*T34*T45;
    x = T05(1,4);
    y = T05(2,4);
    z = T05(3,4);
    beta_T05 = atan2d(-T05(3,1),sqrt(T05(1,1)^2+T05(2,1)^2));
    alpha_T05 = atan2d(T05(2,1)/cosd(beta_T05),T05(1,1)/cosd(beta_T05));
    gama_T05 = atan2d(T05(3,2)/cosd(beta_T05),T05(3,3)/cosd(beta_T05));
    
    KQ_T05_frame = [x,y,z,gama_T05,beta_T05,alpha_T05]; 
    %%
    c1 = cosd(theta1); c13 = cosd(theta1+theta3);   c135 = cosd(theta1+theta3+theta5);
    c2 = cosd(theta2);  c24 = cosd(theta2+theta4);   c246 = cosd(theta2+theta4+theta6);
    c3 = cosd(theta3);  c4 = cosd(theta4);  c5 = cosd(theta5);  c6 = cosd(theta6);
    
    s1 = sind(theta1); s13 = sind(theta1+theta3);   s135 = sind(theta1+theta3+theta5);
    s2 = sind(theta2);  s24 = sind(theta2+theta4);   s246 = sind(theta2+theta4+theta6);
    s3 = sind(theta3);  s4 = sind(theta4);  s5 = sind(theta5);  s6 = sind(theta6);
    
    xv = c1*(L1+L2*c2 + c3*(L3+c24+L4*c5*c246));
    yv = s1*(L2*c2 + s3*(L3+c24+L4*s5*c246));
    
    %%
    Position = [x y z Px Py Pz gama_T07 beta_T07 alpha_T07];
    Position_c2 = [xv yv];
    KQ = [Px Py Pz gama_T07 beta_T07 alpha_T07];
end