clc;
close all;

%% Initial
n = 4;
L = 20;
theta = zeros(n,1);
theta(1,1) = 90;
angle = zeros(n,1);
%% Main program
P_start = [30 10 15];
P_end = [30 10 30];
for time = 0:0.1:10
    t = Line(P_start,P_end,time,5);
    P = FABRIK_Create_Shape(L-7,n,t,theta,"XYZ");
    P1 = P(2,:)';
    P2 = P(3,:)';
        %% Amplitude seg 1
    n_seg1 = 2000;
    L_seg1 = 0.01;
    theta_seg1 = zeros(n_seg1,1);
    theta_seg1(1,1) = 90;
    angle_seg1 = zeros(n_seg1,1);
    t_seg1 = P1';
    %% Amplitude seg 2
    n_seg2 = 2002;
    L_seg2 = 0.01;
    theta_seg2 = zeros(n_seg2,1);
    theta_seg2(1,1) = 90;
    angle_seg2 = zeros(n_seg2,1);
    t_seg2 = P2';
    %% Amplitude seg 3
    n_seg3 = 2002;
    L_seg3 = 0.01;
    theta_seg3 = zeros(n_seg3,1);
    theta_seg3(1,1) = 90;
    angle_seg3 = zeros(n_seg3,1);
    t_seg3 = t;
    %% Create robot
    P_seg1 = Tao_Robot_n_diem(n_seg1,L_seg1,theta_seg1);
    P_seg2 = Tao_Robot_n_diem(n_seg2,L_seg2,theta_seg2);
    P_seg3 = Tao_Robot_n_diem(n_seg3,L_seg3,theta_seg3);
    %% Main program
    [P_seg1,angle_seg1] = FABRIK(L_seg1,n_seg1,P_seg1,t_seg1,"XYZ");
    % Set up Seg 2
    P_seg2(1,:) = P_seg1(n_seg1-1,:);
    P_seg2(2,:) = P_seg1(n_seg1,:);
    P_seg2 = FABRIK_1_Demension(L_seg2,n_seg2,P_seg2);
    [P_seg2,angle_seg2] = FABRIK(L_seg2,n_seg2,P_seg2,t_seg2,"XYZ");
    % Set up Seg 3
    P_seg3(1,:) = P_seg2(n_seg2-1,:);
    P_seg3(2,:) = P_seg2(n_seg2,:);
    P_seg3 = FABRIK_1_Demension(L_seg3,n_seg3,P_seg3);
    [P_seg3,angle_seg3] = FABRIK(L_seg3,n_seg3,P_seg3,t_seg3,"XYZ");

    %% Paint Robot
    hold off;
    Ve_Robot(P_seg1,2*n_seg1,L_seg1,t_seg1);
    Ve_Robot(P_seg2,2*n_seg2,L_seg2,t_seg2);
    Ve_Robot(P_seg3,2*n_seg3,L_seg3,t_seg3);
    pause(0.01);
    clear P;
end

function P = Line(Start,End,t,tf)
Px0 = Start(1); Py0 = Start(2); Pz0 = Start(3);
Pxf = End(1); Pyf = End(2); Pzf = End(3);
if mod(t,2*tf)<=tf    
   tp = t-floor(t/(2*tf))*2*tf;
   Px = Px0+(3/tf^2)*(Pxf-Px0)*tp.^2 - (2/tf^3)*(Pxf-Px0)*tp.^3;
   Py = Py0+(3/tf^2)*(Pyf-Py0)*tp.^2 - (2/tf^3)*(Pyf-Py0)*tp.^3;
   Pz = Pz0+(3/tf^2)*(Pzf-Pz0)*tp.^2 - (2/tf^3)*(Pzf-Pz0)*tp.^3;   
else
%     temp = Pz0;
%     Pz0 = Pzf;
%     Pzf = temp;  
    temp1 = Px0;
    temp2 = Py0;
    temp3 = Pz0;
    Px0 = Pxf; Pxf = temp1;
    Py0 = Pyf; Pyf = temp2;
    Pz0 = Pzf; Pzf = temp3;
    tt = t-floor(t/(2*tf))*2*tf-tf;   
    Px = Px0+(3/tf^2)*(Pxf-Px0)*(tt).^2 - (2/tf^3)*(Pxf-Px0)*(tt).^3;
    Py = Py0+(3/tf^2)*(Pyf-Py0)*(tt).^2 - (2/tf^3)*(Pyf-Py0)*(tt).^3;
    Pz = Pz0+(3/tf^2)*(Pzf-Pz0)*(tt).^2 - (2/tf^3)*(Pzf-Pz0)*(tt).^3;
end
P = [Px Py Pz];
end