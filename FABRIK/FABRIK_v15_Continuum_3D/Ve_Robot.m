function Ve_Robot(P_joints,n,L,Pf)
    plot3(P_joints(:,1),P_joints(:,2),P_joints(:,3),'-b.', 'linewidth', 1);
    xlim([-L*n-0.2*L*n L*n+0.2*L*n]);  
    ylim([-L*n-0.2*L*n L*n+0.2*L*n]);
    zlim([0 L*n+0.2*L*n]);
    grid on;
    hold on;
    %plot3(Pf(:,1),Pf(:,2),Pf(:,3),'-rO', 'linewidth', 3);
    plot3(P_joints(n/2,1),P_joints(n/2,2),P_joints(n/2,3),'-rO', 'linewidth', 3);
    %hold on;
end