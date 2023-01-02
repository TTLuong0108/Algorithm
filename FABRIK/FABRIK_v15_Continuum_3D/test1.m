clc;
close all;
%%
t = [1 1 11];
[P1,P2] = Create_Shape(60,0,3,4,5,t);
plot3([0 P1(1,1) P2(1,1) t(1)],[0 P1(2,1) P2(2,1) t(2)],[0 P1(3,1) P2(3,1) t(3)],'-rO', 'linewidth', 3);