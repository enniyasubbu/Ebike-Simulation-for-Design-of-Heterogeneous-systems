% This script will configure and run the simulation.

disp( '#######################' );

%% first simulation run
% update model parameters for basic version of bike
disp( 'Model Parameters of Basic version bike.' );

M_Driver =input('Enter the mass of Driver in kilograms' );

M_Bike = input('Enter the mass of Bike in Kilograms'); 

g = 9.8;
disp( 'g - gravity is 9.8m/s^2.' );
P = 1.225;
disp( 'P - density of air is 1.225 kg/m^3.' );
Cw = 1.1;
disp( 'Cw - air drag coefficient constant is 1.1.' );
Cr = 0.006;
disp( 'Cr - rolling friction coefficient is 0.006.' );
A = 0.5;
disp( 'A - frontal area of driver and bike is 0.5 m^2.' );

% run simulation
% compute statistics from simulation result
prepare_sim

run1 = sim('ebike_01');
out_1 = run1.get('simout1');    

s_time = out_1.time;    % Time 
i_ah=out_1.signals.values(:,1); % Battery Current.
s_energy=out_1.signals.values(:,2); % support Energy
d_energy=out_1.signals.values(:,3); % Driver Energy
tot_energy=out_1.signals.values(:,4); %Energy Total




subplot(4,2,1);
plot(s_time,i_ah,'g');
title('Battery current variation in time in Basic version bike');
xlabel('Time')
ylabel('Battery current')


subplot(4,2,3);
plot(s_time,s_energy,'r');
title('Support energy variations in time in basiv Version bike');
xlabel('Time')
ylabel('Support Energy')


subplot(4,2,5);
plot(s_time,d_energy,'b');
title('Driver Energy variations in time');
xlabel('Time')
ylabel('Driver Energy')


subplot(4,2,7);
plot(s_time,tot_energy);
title('Total Energy variations in time');
xlabel('Time')
ylabel('Battery current')

disp( '#######################' );
disp( '#######################' );
%% second simulation run
% update model parameters for sports version of bike

% update model parameters for basic version of bike
disp( 'Model Parameters of Basic version bike.' );

M_Driver =input('Enter the mass of Driver in kilograms' );
M_Bike = input('Enter the mass of Bike in Kilograms'); 
g = 9.8;
disp( 'g - gravity is 9.8m/s^2.' );
P = 1.225;
disp( 'P - density of air is 1.225 kg/m^3.' );
Cw = 0.8;
disp( 'Cw - air drag coefficient constant is 1.1.' );
Cr = 0.003;
disp( 'Cr - rolling friction coefficient is 0.006.' );
A = 0.38;
disp( 'A - frontal area of driver and bike is 0.5 m^2.' );

% run simulation
% compute statistics from simulation result
prepare_sim

run2 = sim('ebike_01');
out_2 = run2.get('simout2');

s_time1 = out_2.time;    % Time 
i_ah1=out_2.signals.values(:,1); % Battery Current.
s_energy1=out_2.signals.values(:,2); % support Energy
d_energy1=out_2.signals.values(:,3); % Driver Energy
tot_energy1=out_2.signals.values(:,4); %Energy Total


subplot(4,2,2);
plot(s_time1,i_ah1,'g');
title('Battery current variation in time in Race bike');
xlabel('Time')
ylabel('Battery current')


subplot(4,2,4);
plot(s_time1,s_energy1,'r');
title('Support energy variations in time in race bike');
xlabel('Time')
ylabel('Support Energy')


subplot(4,2,6);
plot(s_time1,d_energy1,'b');
title('Driver Energy variations in time in Race Bike');
xlabel('Time')
ylabel('Driver Energy')


subplot(4,2,8);
plot(s_time1,tot_energy1);
title('Total Energy variations in time in race bike');
xlabel('Time')
ylabel('Battery current')

disp( '#######################' );
disp( '#######################' );
   
%% Calculating Battery status
[z] = sim('ebike01');
[sim3] = z.get('simout').signals.values;
battery_status = [sim3]
if battery_status <= 10.5
    display('Battery has low power, Hence Terminating Simulation');
end

disp( 'Done.' );
disp( '#######################' );