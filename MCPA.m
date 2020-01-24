% Initialize fundamental constants 
set(0,'DefaultFigureWindowStyle','normal')

global C
C.temp = 300;                       % Initial temperature 
C.kb = 1.3806504e-23;               % Boltzmann constant
C.m_0 = 9.10938215e-31;             % Electron mass
C.g = 9.80665;                      % metres (32.1740 ft) per s²
C.q_0 = 1.60217653e-19;             % electron charge

NumAdvances = 200; 
dt = 1;
time = 0;
distance = 0;
Ex = 0.2;

% (a) For a single electron initialize a position at x = 0 and a velocity of v = 0;
x = zeros(1,NumAdvances);

Vx = zeros(1,NumAdvances);


% (PArt b-d) Advance the electron in time updating it?s position and velocity with a force present.
figure('Name', 'Updating position and velocity')


for i=2:NumAdvances
    % F/m = eEx/m_e
    % F = (C.q_0*Ex)/(C.m_0)
    dvx = (1)*dt;
    Vx(i) = Vx(i-1) + dvx;
     
    dx = Vx(i) * dt;
    
    x(i) = x(i-1) + dx;
    distance = distance + dx;
    time = time + dt; 
    
    scattered = rand();
    prob_scattered = 0.05;
    if scattered <= prob_scattered
        Vx(i) = 0;
    end 
    
    drift_velocity = sum(Vx)/i;

     
    %figure('Name', 'Part B: Updating position and velocity')
    subplot(2,1,1);
    plot([time-dt, time], [x(i-1), x(i)]);
    pause(0.000001);
    xlabel('Time (s)');
    ylabel('Position (m)');
    title('Particle Position');
    hold on;
    
    str = sprintf('Pjarticle Velocity, drift velocity (in green): %.3d m/s', drift_velocity);

    subplot(2,1,2); 
    plot([time-dt, time], [Vx(i-1), Vx(i)]);
    pause(0.000001);
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    title(str);
    hold on;
    plot(time, drift_velocity, 'g*');
    
    
end 


% (c) Plot the position and velocity as a movie (use plot() and hold on)
% (d) Now assign a probability of scattering of 0.05 at each time step. Using rand() decide if it scattered
% during the last time step and if so set v back to 0. Show us the movie.


% (e) Calculate the drift velocity and display it in the title.
% (f) Play with the simulator. Make if run for many particles at the same time (make x and v vectors).
% (g) Try different scattering rules and see how that effects the average (drift) velocity

% NumAdvances = 200; 
% dt = 1;
% time = 0;
% distance = 0;
% Ex = 0.2;
% 
% % (a) For a single electron initialize a position at x = 0 and a velocity of v = 0;
% x = zeros(3,NumAdvances);
% 
% Vx = zeros(3,NumAdvances);
% 
% 
% % (PArt b-d) Advance the electron in time updating it?s position and velocity with a force present.
% figure('Name', 'Updating position and velocity')
% 
% 
% for i=2:NumAdvances
%     for p=1:3
%     % F/m = eEx/m_e
%     % F = (C.q_0*Ex)/(C.m_0)
%     dvx = (1)*dt;
%     Vx(p,i) = Vx(p,i-1) + dvx;
%      
%     dx = Vx(p,i) * dt;
%     
%     x(p,i) = x(p,i-1) + dx;
%     distance = distance + dx;
%     time = time + dt; 
%     
%     scattered = rand();
%     prob_scattered = 0.5;
%     if scattered <= prob_scattered
%         Vx(p,i) = 0;
%     end 
%     
%     drift_velocity = sum(Vx(p))/i;
%     end 
%      
%     %figure('Name', 'Part B: Updating position and velocity')
%     subplot(2,1,1);
%     plot([time-dt, time], [x(1,i-1), x(1,i)]);
%     plot([time-dt, time], [x(2,i-1), x(2,i)]);
%     plot([time-dt, time], [x(3,i-1), x(3,i)]);
%     pause(0.000001);
%     xlabel('Time (s)');
%     ylabel('Position (m)');
%     title('Particle Position');
%     hold on;
%     
%     str = sprintf('Pjarticle Velocity, drift velocity (in green): %.3d m/s', drift_velocity);
% 
%     subplot(2,1,2); 
%     plot([time-dt, time], [Vx(1,i-1), Vx(1,i)]);
%     plot([time-dt, time], [Vx(2,i-1), Vx(2,i)]);
%     plot([time-dt, time], [Vx(3,i-1), Vx(3,i)]);
%     pause(0.000001);
%     xlabel('Time (s)');
%     ylabel('Velocity (m/s)');
%     title(str);
%     hold on;
%     plot(time, drift_velocity, 'g*');
%     
% end 

