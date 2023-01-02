%% calculate the curvature
clc;
close all;
tic;
%% Initial
n = 4;
L = 20;
theta = zeros(n,1);
theta(1,1) = 90;
angle = zeros(n,1);
t = [40 10 20];
P = FABRIK_Create_Shape(L-3,n,t,theta,"XYZ");
%[P,angle] = FABRIK(L,n,P,t,"XYZ");
P1 = P(2,:)';
P2 = P(3,:)';
%Ve_Robot(P,n,L,t);
%[P1,P2] = Create_Shape(120,0,20,20,20,t);
%% Amplitude seg 1
n_seg1 = 2000;
L_seg1 = 0.01;
theta_seg1 = zeros(n_seg1,1);
theta_seg1(1,1) = 90;
t_seg1 = P1';
%% Amplitude seg 2
n_seg2 = 2002;
L_seg2 = 0.01;
theta_seg2 = zeros(n_seg2,1);
theta_seg2(1,1) = 90;
t_seg2 = P2';
%% Amplitude seg 3
n_seg3 = 2002;
L_seg3 = 0.01;
theta_seg3 = zeros(n_seg3,1);
theta_seg3(1,1) = 90;
t_seg3 = t;
%% Create robot
P_seg1 = Tao_Robot_n_diem(n_seg1,L_seg1,theta_seg1);
P_seg2 = Tao_Robot_n_diem(n_seg2,L_seg2,theta_seg2);
P_seg3 = Tao_Robot_n_diem(n_seg3,L_seg3,theta_seg3);
%% Main program
[P_seg1,angle_seg1] = FABRIK(L_seg1,n_seg1,P_seg1,t_seg1,"XYZ");
theta1 = atan2d(t_seg1(2),t_seg1(1))
Ptemp1 = Position(P_seg1(n_seg1-1,:),P_seg1(n_seg1,:),[sind(theta1) -cosd(theta1) 0 0],[0 0 1 0])
Cur1 = 1/Distance(P_seg1(n_seg1,:),Ptemp1)
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
%
a = toc;
%% Paint Robot
Ve_Robot(P_seg1,2*n_seg1,L_seg1,t_seg1);
Ve_Robot(P_seg2,2*n_seg2,L_seg2,t_seg2);
Ve_Robot(P_seg3,2*n_seg3,L_seg3,t_seg3);
plot3(Ptemp1(1),Ptemp1(2),Ptemp1(3),"rX");