% HW 3 Problem 2 of M20 in Fall 2019
% Improved computation of population

% Amy Yu 905138432
% 10/22/19

clc; clear all; close all;

tic
% defining constants
alpha = 3;
beta = 2;
gamma = 2;
rho = 1.5;
epsilon = 0.3;
delta = 0.2;
sigma = -0.4;

% define change in time
delta_t = 0.01;

% define final and initial times
tf = 10;
ti = 0;

% time that new effect takes place
t = 5;
Nsteps = ceil((tf-ti)/delta_t);

% define starting populations
x_old = 5;
y_old = 2;

% plot the figure
f = figure;
plot(0, x_old, 'b.', 0, y_old, 'm.');
hold on;

% add axes labels and title
xlabel('Time')
ylabel('Population')
title('Population of Two Species Under Competition')

for i = 1:Nsteps
  
% calculate new populations
    x_new = x_old + delta_t * ((alpha*x_old) - (epsilon*x_old*x_old) - (beta*x_old*y_old));
    y_new = y_old + delta_t* ((-gamma*y_old) + (rho*x_old*y_old) - (delta*y_old*y_old));
    
% plot all the points
    plot(i*delta_t, x_new, 'b.', i*delta_t, y_new, 'm.');
        
% account for new factor on Species X
    if (ti >= t)
        alpha = alpha * (exp((-(t-ti)*(t-ti))/(2*sigma*sigma)));
        t = t + delta_t;
    end
    
% update initial time to current time
    ti = ti + delta_t;

% update populations
    x_old = x_new;
    y_old = y_new;
end

% create legend and save figure
legend({'Species X','Species Y'},'Location','northeast')
%saveas(f, 'hw3_p2_figure.jpeg')

% print results
fprintf('The final populations are:\n');
fprintf('Species X = %10.5f\n', x_new);
fprintf('Species Y = %10.5f\n', y_new);
toc
