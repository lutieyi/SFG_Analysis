%% SFG4 Plot

SFG4_data_1a = importdata("./Data_For_Comparison/SFG4/08-24_zwitter_salt/sbma/sbma_1_2800_3600_ssp_3400_opt_1.txt");
SFG4_data_1b = importdata("./Data_For_Comparison/SFG4/08-24_zwitter_salt/sbma/sbma_1_2800_3600_ssp_2850_opt_1.txt");

SFG4_data_2a = importdata("./Data_For_Comparison/SFG4/09-22-2021_sbma_afterSFG4/sbma_water_2750_3000_ssp_align2845_1.txt");
SFG4_data_2b = importdata("./Data_For_Comparison/SFG4/09-22-2021_sbma_afterSFG4/sbma_water_2750_3000_ssp_align3400_2.txt");

% {'Wavenumber',' PMT',' VIS','IR',' Norm/I','Norm/V*I'}
figure(1)
hold on
plot(SFG4_data_1a.data(:,1),SFG4_data_1a.data(:,2),'LineWidth',4,'Color',[0 0 0])
plot(SFG4_data_2a.data(:,1),SFG4_data_2a.data(:,2)+400,'LineWidth',4,'Color',[1 0 0])

annotation('textbox',[.2 .45 .3 .3],'String','2845 Opt','FitBoxToText','on','Color',[0.3 0 0],'FontSize',20 )
annotation('textbox',[.65 .45 .3 .3],'String','3400 Opt','FitBoxToText','on','Color',[1 0 0],'FontSize',20 )


plot(SFG4_data_1b.data(:,1),SFG4_data_1b.data(:,2),'LineWidth',4,'Color',[0.3 0 0])
plot(SFG4_data_2b.data(:,1),SFG4_data_2b.data(:,2)+400,'LineWidth',4,'Color',[0.8 0 0])

%plot(SFG4_data_1b.data(:,1),SFG4_data_1b.data(:,6),'LineWidth',4,'Color','red')
%plot(SFG4_data_2b.data(:,1),SFG4_data_2b.data(:,6),'LineWidth',4,'Color',[0 0 1])
% plot (LineStyle, LineWidth, Color,)
set(gca,'FontSize',24);
title("SFG4 Before and After Service - pSBMA/Water",'FontSize',32)

xlim([2750 3700])
ylim([-100 1100])
xlabel("Wavenumber (cm^{-1})",'FontSize',28)
ylabel("SFG Intensity (a.u.)",'FontSize',28)
legend("Before","After")

x0=200;
y0=200;
width=1150;
height=700;

set(gcf,'position',[x0,y0,width,height]);

hold off
saveas(figure(1),"./SFG4_before_after_sbma_ssp_water.png")
%% Figure 2, Normalized

% {'Wavenumber',' PMT',' VIS','IR',' Norm/I','Norm/V*I'}
Norm_1a = SFG4_data_1a.data(:,2) ./ SFG4_data_1a.data(:,3) ./ SFG4_data_1a.data(:,4);
Norm_2a = SFG4_data_2a.data(:,2) ./ SFG4_data_2a.data(:,3) ./ SFG4_data_2a.data(:,4);
figure(2)
subplot(2,1,1)
plot(SFG4_data_1a.data(:,1),Norm_1a,'LineWidth',4,'Color',[0 0 0])
set(gca,'FontSize',24);
title("SFG4 Before and After Service - pSBMA/Water",'FontSize',32)

xlim([2750 3700])
%ylim([-100 1100])
%xlabel("Wavenumber (cm^{-1})",'FontSize',28)
ylabel("Normalized SFG Intensity (a.u.)",'FontSize',22)
legend("Before")

subplot(2,1,2)
plot(SFG4_data_2a.data(:,1),Norm_2a,'LineWidth',4,'Color',[1 0 0])

set(gca,'FontSize',24);


xlim([2750 3700])
%ylim([-100 1100])
xlabel("Wavenumber (cm^{-1})",'FontSize',28)
ylabel("Normalized SFG Intensity (a.u.)",'FontSize',22)
legend("After")

x0=200;
y0=200;
width=1150;
height=700;

set(gcf,'position',[x0,y0,width,height]);
saveas(figure(2),"./SFG4_before_after_sbma_ssp_norm.png")