% HW 4 Problem 2 of M20 in Fall 2019
% Pendulum

% Amy Yu 905138432
% 10/29/19

clc; clear all; close all;

%% Set coefficients as variables
g = 10;
L = 10;
d = 0.01;

%% Set times and number of steps
delta_t = 0.01;
ti = 0;
tf = 50;
Nsteps = ceil((tf-ti)/delta_t);

%% Create arrays of zeros of size Nsteps
omega = zeros(Nsteps, 1);
theta = zeros(Nsteps, 1);
omega2 = zeros(Nsteps, 1);
theta2 = zeros(Nsteps, 1);
t = zeros(Nsteps, 1);
t2 = zeros(Nsteps, 1);

%% Initial condition
omega(1) = 0;
theta(1) = 0.1;
t(1) = 0;

omega2(1) = 0;
theta2(1) = 0.1;
t2(1) = 0;

%% Compute Explicit Euler Method
for k=1:Nsteps-1
    t(k+1) = k * delta_t;
    omega(k+1) = omega(k) + delta_t * ((-g/L) * sin(theta(k)) - (omega(k)*L*d));
    theta(k+1) = theta(k) + delta_t * (omega(k));
end

%% Compute Semi-Implicit Euler Method
for k=1:Nsteps-1
    t2(k+1) = k * delta_t;
    omega2(k+1) = (omega2(k) - delta_t*(g/L)*sin(theta2(k))) / (1+(2*delta_t*d*L));
    theta2(k+1) = theta2(k) + delta_t * omega2(k+1);
end

%% Plot
h1 = figure(1);
plot(t, theta,'m.', t2, theta2, 'c.');
legend({'Explicit','Semi-Implicit'},'Location','northeast')
set(gca, 'FONTSIZE', 10);
xlabel('Time [s]', 'FONTSIZE', 10);
ylabel('Angular Position [rad]', 'FONTSIZE', 10);
title('Simulation of a Pendulum with Damping')
box on
saveas(h1, 'pendulum_damping.png');

