function Pe_new = Rotation_theta1(theta,theta2,theta3,theta4,L1,L2,L3,L4)
theta1 = theta;
% if(theta1 >= 45)
%     theta1 = 45;
% else if(theta1 <= -45)
%         theta1 = -45;
%     end
% end
Px5 = L1 + L2*cosd(theta1)*cosd(theta2) - L3*cosd(theta4)*(sind(theta1)*sind(theta3) - cosd(theta1)*cosd(theta2)*cosd(theta3)) - L3*cosd(theta1)*sind(theta2)*sind(theta4);
Py5 = L2*cosd(theta2)*sind(theta1) + L3*cosd(theta4)*(cosd(theta1)*sind(theta3) + cosd(theta2)*cosd(theta3)*sind(theta1)) - L3*sind(theta1)*sind(theta2)*sind(theta4);
Pz5 = L2*sind(theta2) + L3*cosd(theta2)*sind(theta4) + L3*cosd(theta3)*cosd(theta4)*sind(theta2);

Pe_new =[Px5 Py5 Pz5];

end