function [F,angle] = FABRIK_Create_Shape(L,n,t,theta,demension)

    %% Amplitude
    d = zeros(n,1); % Distance
    d_sum = 0;
    lamda = zeros(n,1);
    r = zeros(n,1);
    tol = 0.1; %% error
    phi = zeros(n,1);
    %l = (L-3)*ones(n,1);
    %l(1,1) = L;
    %% Main
    P = Tao_Robot_n_diem(n,L,theta);
    for i=1:n-1
       d(i,1) =  Distance(P(i+1,:),P(i,:));
       d_sum = d_sum + d(i,1);
    end
    dist = Distance(P(1,:),t);  %1.2
    if(dist > d_sum) %1.4
        for i=1:n-1 %1.6
           r(i) = Distance(t,P(i,:)); %1.8
           lamda(i) = d(i)/r(i); %1.9
           P(i+1,:) = (1-lamda(i))*P(i,:)+lamda(i)*t; %1.11
        end
    else
        b = P(1,:); %1.15
        difA = Distance(P(n,:),t); %1.17
        while(difA > tol)
            % STATE 1: FORWARD
            P(n,:) = t; %1.21
            for i=n-1:-1:1 %1.22
                r(i) = Distance(P(i+1,:),P(i,:)); %1.24
                lamda(i) = d(i)/r(i); % 1.25
                P(i,:) = (1-lamda(i))*P(i+1,:)+lamda(i)*P(i,:); %1.27
            end
            % STATE 2: BACKWARD
            P(1,:) = b; % 1.31
            for i=1:n-1
                r(i) = Distance(P(i+1,:),P(i,:)); %1.34
                lamda(i) = d(i)/r(i); % 1.35
                P(i+1,:) = (1-lamda(i))*P(i,:)+lamda(i)*P(i+1,:); %1.37
            end
            difA = Distance(P(n,:),t); %1.39
            
        end
    end
    %% Result
    for i=1:n-2
       phi(i) = Angle_2vector(P(i,:),P(i+1,:),P(i+2,:),demension);
    end
    F = P;
    angle = phi;
end

function P_joints = Tao_Robot_n_diem(N,L,theta)
    %% Tao robot n bac tu do
    n = N; % So bac tu do cua robot
    l = L;  % Chieu dai moi link
    L = zeros(n,1);
    Px = zeros(n+1,1);
    Py = zeros(n+1,1);
    Pz = zeros(n+1,1);
    % t = zeros(n,1);
    t = theta;
    t_sum = 0;
    for i=1:n
       if(i==1)
          L(i) = l; 
       else
        L(i) = l;
       end
       if(i>1)
        t_sum = t_sum + t(i-1);
        Px(i) = Px(i-1)+L(i-1)*cosd(t_sum);
        Py(i) = 0;
        Pz(i) = Pz(i-1)+L(i-1)*sind(t_sum);
       else
        Px(i) = 0;
        Py(i) = 0;
        Pz(i) = 0;
       end
    end
    Px(n+1) = Px(n) + L(n)*cosd(t_sum + t(n)); % Pe theo truc x
    Pz(n+1) = Pz(n) + L(n)*sind(t_sum + t(n)); % Pe theo truc y
    Py(n+1) = 0;
    %%
    P_joints = zeros(n,3);
    for i=1:n
        P_joints(i,1) = Px(i);
        P_joints(i,2) = Py(i);
        P_joints(i,3) = Pz(i);
    end
end