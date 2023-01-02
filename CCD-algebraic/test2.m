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
xlabel('Time(s)','FontSize',25,'FontWeight','bold','Color','k');
title('POSITION RESPONSE','Color','black','FontSize',40);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yyaxis left
ay = gca; 
ay.YColor = 'k';
ylim([-70 70]);
ylabel('Amplitude Py & Pz(mm)','FontSize',25,'FontWeight','bold','Color','k');
yticks(-80:20:80)

Para(1) = plot(out.tout,out.Data_Py_Pz_Response.signals(1).values,'r','LineWidth',3);
Para(2) = plot(out.tout,out.Data_Py_Pz_Response.signals(2).values,'-.r','LineWidth',3);
Para(3) = plot(out.tout,out.Data_Py_Pz_Response.signals(3).values,'k','LineWidth',3);
Para(4) = plot(out.tout,out.Data_Py_Pz_Response.signals(4).values,'-.k','LineWidth',3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yyaxis right
ayy = gca; 
ayy.YColor = 'k';
ylim([720 800]);
ylabel('Amplitude Px(mm)','FontSize',25,'FontWeight','bold','Color','k');
yticks(-720:20:800)

Para(5) = plot(out.tout,out.Data_Px_Response.signals(1).values,'b','LineWidth',3);
Para(6) = plot(out.tout,out.Data_Px_Response.signals(2).values,'-.b','LineWidth',3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

legend(Para,'Desired Py','Actual Py','Desired Pz','Actual Pz','Desired Px','Actual Px');