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
       L(i) = l;
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