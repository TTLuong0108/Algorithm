clc;
close all;
%% Initial
theta1 = 120;
theta2 = 0;

p3 = [1;1;11];
l1 = 5;
l2 = 4;
l3 = 3;
%%
r2 = sqrt(p3(1,1)^2+p3(2,1)^2+p3(3,1)^2);
Vmax = min(r2+l3,l1+l2);
Vmin = max(abs(r2-l3),abs(r2-l3));
r1 = (Vmax-Vmin)*rand(1,1)+Vmin;
%%
Ts1 = r2^2+r1^2-l3^2;
Ms1 = 2*r1*r2;
gama1 = acosd(Ts1/Ms1);
h1 = r1*sind(gama1);
d1 = r2*cosd(gama1);
Ts2 = r1^2+l2^2-l1^2;
Ms2 = 2*r1*l2;
gama2 = acosd(Ts2/Ms2);
h2 = l1*sind(gama2);
d2 = l1*cosd(gama2);
%%
k = [p3(1,1)/r2;p3(2,1)/r2;p3(3,1)/r2];
sa1 = k(2,1)/(sqrt(k(1,1)^2+k(2,1)^2));
ca1 = k(1,1)/(sqrt(k(1,1)^2+k(2,1)^2));
sb1 = (sqrt(k(1,1)^2+k(2,1)^2));
cb1 = k(3,1);
ct1 = cosd(theta1);
st1 = sind(theta1);
%% calculation P2
a12 = ct1*cb1*ca1-ct1*sa1;
a13 = sb1*ca1;
a22 = st1*cb1*sa1+ct1*ca1;
a23 = sb1*sa1;
a32 = -st1*sb1;
a33 = cb1;
p2 = [a12*h1+a13*d1;a22*h1+a23*d1;a32*h1+a33*d1]
%% calculation P1
p2_l = sqrt(p2(1,1)^2+p2(2,1)^2+p2(3,1)^2);
k = [p2(1,1)/p2_l;p2(2,1)/p2_l;p2(3,1)/p2_l];
sa1 = k(2,1)/(sqrt(k(1,1)^2+k(2,1)^2));
ca1 = k(1,1)/(sqrt(k(1,1)^2+k(2,1)^2));
sb1 = (sqrt(k(1,1)^2+k(2,1)^2));
cb1 = k(3,1);
ct1 = cosd(theta2);
st1 = sind(theta2);

a12 = ct1*cb1*ca1-ct1*sa1;
a13 = sb1*ca1;
a22 = st1*cb1*sa1+ct1*ca1;
a23 = sb1*sa1;
a32 = -st1*sb1;
a33 = cb1;
p1 = [a12*h1+a13*d1;a22*h1+a23*d1;a32*h1+a33*d1];
%%
grid on;
plot3([0 p1(1,1) p2(1,1)],[0 p1(2,1) p2(2,1)],[0 p1(3,1) p2(3,1)],'-rO', 'linewidth', 3);