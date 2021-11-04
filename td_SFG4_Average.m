%% td_SFG4_Average
% For averaging the td-SFG collected from SFG4 when it is not averaged by
% the spectrometer program.

Average_Step = 10; % User Input: specify the desired time step for averaging

%%
tdSFG = importdata("TIME DEPENDENT ZnCl2.txt");
% Time PMT VIS IR Norm/I Norm/V*I

max_timestep = (size(tdSFG.data(:,1),1) - mod(size(tdSFG.data(:,1),1),Average_Step))/Average_Step ;

Time = zeros(max_timestep,1);           %Time step after the average
SFGavg = zeros(max_timestep,1);         %SFG after the average

for i = 1:max_timestep
    Time(i) = tdSFG.data(Average_Step*i,1);
    SFGavg(i) = mean(tdSFG.data( (i-1)*Average_Step +1:i*Average_Step,2));
end
figure(1)
plot(tdSFG.data(:,1), tdSFG.data(:,2));
figure(2)
plot(Time,SFGavg)
mean(tdSFG.data(1:5));