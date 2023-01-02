function [F,angle] = FABRIK(L,n,P,t,demension)
    %% Amplitude
    d = zeros(n,1); % Distance
    d_sum = 0;
    lamda = zeros(n,1);
    r = zeros(n,1);
    tol = 0.1; %% error
    phi = zeros(n,1);
    %% Main
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