function d = Distance(a,b)
    xa = a(1); ya = a(2); za = a(3);
    xb = b(1); yb = b(2); zb = b(3);
    d = sqrt((xb-xa)^2 + (yb-ya)^2 + (zb-za)^2);
end