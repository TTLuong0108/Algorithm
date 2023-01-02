function Pe_new = Rotation_theta5(theta1,theta2,theta3,theta4,theta,theta6,L1,L2,L3,L4)
theta5 = theta;
% if(theta5 > 50)
%     theta5 = 50;
% else if(theta5 < -50)
%         theta5 = -50;
%     end
% end
Px7 = L1 + L2*cosd(theta1)*cosd(theta2) + L4*sind(theta6)*(sind(theta4)*(sind(theta1)*sind(theta3) - cosd(theta1)*cosd(theta2)*cosd(theta3)) - cosd(theta1)*cosd(theta4)*sind(theta2)) - L4*cosd(theta6)*(cosd(theta5)*(cosd(theta4)*(sind(theta1)*sind(theta3) - cosd(theta1)*cosd(theta2)*cosd(theta3)) + cosd(theta1)*sind(theta2)*sind(theta4)) + sind(theta5)*(cosd(theta3)*sind(theta1) + cosd(theta1)*cosd(theta2)*sind(theta3))) - L3*cosd(theta4)*(sind(theta1)*sind(theta3) - cosd(theta1)*cosd(theta2)*cosd(theta3)) - L3*cosd(theta1)*sind(theta2)*sind(theta4); 
Py7 = L2*cosd(theta2)*sind(theta1) - L4*sind(theta6)*(sind(theta4)*(cosd(theta1)*sind(theta3) + cosd(theta2)*cosd(theta3)*sind(theta1)) + cosd(theta4)*sind(theta1)*sind(theta2)) + L3*cosd(theta4)*(cosd(theta1)*sind(theta3) + cosd(theta2)*cosd(theta3)*sind(theta1)) + L4*cosd(theta6)*(cosd(theta5)*(cosd(theta4)*(cosd(theta1)*sind(theta3) + cosd(theta2)*cosd(theta3)*sind(theta1)) - sind(theta1)*sind(theta2)*sind(theta4)) + sind(theta5)*(cosd(theta1)*cosd(theta3) - cosd(theta2)*sind(theta1)*sind(theta3))) - L3*sind(theta1)*sind(theta2)*sind(theta4);
Pz7 = L2*sind(theta2) + L4*sind(theta6)*(cosd(theta2)*cosd(theta4) - cosd(theta3)*sind(theta2)*sind(theta4)) + L3*cosd(theta2)*sind(theta4) + L4*cosd(theta6)*(cosd(theta5)*(cosd(theta2)*sind(theta4) + cosd(theta3)*cosd(theta4)*sind(theta2)) - sind(theta2)*sind(theta3)*sind(theta5)) + L3*cosd(theta3)*cosd(theta4)*sind(theta2);
 
 Pe_new =[Px7 Py7 Pz7];

end