close all;
clc;
clear Para;
clear ax;

figure(1);
hold on
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlim([0 45]);
xticks(0:5:45)
ax = gca; 
ax.FontSize = 20; 
ax.FontWeight= 'bold';
ax.XColor = 'k';

xlabel('Time(s)');
title('POSITION RESPONSE','FontSize',40);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ylim([720 800]);
ylabel('Amplitude Px(mm)');
yticks(-720:20:800)

Para(1) = plot(out.tout,out.Data_Px_Response.signals(1).values,'k','LineWidth',3);
Para(2) = plot(out.tout,out.Data_Px_Response.signals(2).values,'-.k','LineWidth',3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yyaxis right
ay = gca
ay.YColor = 'k';
% ylim([80 80]);
ylabel('Amplitude Py & Pz(mm)');
yticks(-80:20:80)

Para(1) = plot(out.tout,out.Data_Py_Pz_Response.signals(1).values,'r','LineWidth',3);
Para(2) = plot(out.tout,out.Data_Py_Pz_Response.signals(2).values,'-.r','LineWidth',3);
Para(3) = plot(out.tout,out.Data_Py_Pz_Response.signals(3).values,'b','LineWidth',3);
Para(4) = plot(out.tout,out.Data_Py_Pz_Response.signals(4).values,'-.b','LineWidth',3)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

legend('Desired Px','Actual Px','Desired Py','Actual Py','Desired Pz','Actual Pz');