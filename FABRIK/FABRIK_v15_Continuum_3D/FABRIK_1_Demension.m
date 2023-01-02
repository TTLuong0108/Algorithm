function F = FABRIK_1_Demension(L,n,P)
    for i=3:n
        d = L;
        r = Distance(P(i-1,:),P(i-2,:));
        lamda = 2*d/r; 
        P(i,:) = (1-lamda)*P(i-2,:)+lamda*P(i-1,:);
    end
    F = P;
end