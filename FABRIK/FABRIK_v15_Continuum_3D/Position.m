function ans = Position(A,B,vector1,vector2)
    b1 = B(1);  b2 = B(2);  b3 = B(3);
    m = vector1(1);  n = vector1(2);  p = vector1(3);  q = vector1(4);
    AB = B-A;
    A1 = AB(1); A2 = AB(2); A3 = AB(3);
    if(m~=0)
        %% tinh delta 1
        TS_del1 = A1*q/m + A2*b2 + A3*b3 + A1*b1;
        MS_del1 = A2 - A1*n/m;
        delta1 = TS_del1/MS_del1;
        %% tinh delta 2
        TS_del2 = -A3 + A1*p/m;
        MS_del2 = A2 - A1*n/m;
        delta2 = TS_del2/MS_del2;
        %% tinh delta 3
        delta3 = -delta2*n/m - p/m;
        %% tinh delta 4
        delta4 = -q/m - delta1*n/m - b1;
        %% 
        M = delta3^2 + delta2^2 + 1;
        N = 2*delta3*delta4 + 2*delta2*(delta1-b2) - 2*b3;
        C = delta4^2 + b3^2 + (delta1-b2)^2 - A1^2 - A2^2 - A3^2;
        delta = sqrt(N^2 - 4*M*C);

    elseif(m==0 && n~=0)
        %% tinh delta 1
        TS_del1 = A2*q/n + A2*b2 + A3*b3 + A1*b1;
        MS_del1 = A1 - A2*m/n;
        delta1 = TS_del1/MS_del1;
         %% tinh delta 2
        TS_del2 = -A3 + A2*p/n;
        MS_del2 = A1 - A2*m/n;
        delta2 = TS_del2/MS_del2;
        %% tinh delta 3
        delta3 = -delta2*m/n - p/n;
        %% tinh delta 4
        delta4 = -q/m - delta1*m/n - b2;
        %%
        M = delta3^2 + delta2^2 + 1;
        N = 2*delta3*delta4 + 2*delta2*(delta1-b1) - 2*b3;
        C = delta4^2 + b3^2 + (delta1-b1)^2 - A1^2 - A2^2 - A3^2;
        delta = sqrt(N^2 - 4*M*C);
    else
        %% tinh delta 1
        TS_del1 =  A2*b2 + A3*p/q + A1*b1;
        MS_del1 = A1;
        delta1 = TS_del1/MS_del1;
         %% tinh delta 2
        delta2 = -A1/A2;
        %% 
        M = delta2^2 + 1;
        N = 2*delta2*(delta1-b1) - 2*b2;
        C = + b2^2 + (delta1-b1)^2 +(-q/p - b3)^2 - A1^2 - A2^2 - A3^2;
        delta = sqrt(N^2 - 4*M*C);
    end
    %%
    l3 = (-N - sqrt(delta)) / 2*M;
    l2 = delta1 + delta2*l3;
    l1 = (-q - n*l2 - p*l3)/m;
    %%
    m = vector2(1);  n = vector2(2);  p = vector2(3);  q = vector2(4);
    Ptemp = [l1 l2 l3];
    TS = -q - m*B(1) - n*B(2) - p*B(3);
    MS = m*(Ptemp(1) - B(1)) + n*(Ptemp(2) - B(2)) + p*(Ptemp(3) - B(3));
    t = TS/MS;
    l1 = B(1) + (Ptemp(1) - B(1))*t;
    l2 = B(2) + (Ptemp(2) - B(2))*t;
    l3 = B(3) + (Ptemp(3) - B(3))*t;
    ans = [l1 l2 l3];
%     d = Distance(A,B);
%     r = Distance(Ptemp,B);
%     lamda = d/r;
%     t = (1-lamda)*B + lamda*Ptemp;
end