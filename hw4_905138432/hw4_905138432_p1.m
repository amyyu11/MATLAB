% HW 4 Problem 1 of M20 in Fall 2019
% Correlation coefficient of populations of lynx and hare in one period

% Amy Yu 905138432
% 10/29/19

clc; clear all; close all;

%% Set coefficients as variables
a = 0.4;
b = -0.018;
c = -0.8;
d = 0.023;

%% Set times and number of steps
delta_t = 0.01;
ti = 0;
tf = 40;
Nsteps = ceil((tf-ti)/delta_t);

%% Create arrays of zeros of size Nsteps
x = zeros(Nsteps, 1);
y = zeros(Nsteps, 1);
t = zeros(Nsteps, 1);

%% Initial condition
x(1) = 20;
y(1) = 2;

%% Compute Lotka–Volterra equations
for k=1:Nsteps-1
    x(k+1) = x(k) + delta_t * ((a*x(k)) + (b*x(k)*y(k)));
    y(k+1) = y(k) + delta_t * ((c*y(k)) + (d*x(k)*y(k)));
    t(k+1) = k * delta_t;
    
% Compute period
    if (y(k+1) > y(k) && t(k+1) < 10)
        max = t(k+1);
    end
    
    if (y(k+1) > y(k) && t(k+1) < 25)
        max2 = t(k+1);
    end
end

period = max2-max;

%% Pearson's linear correlation coefficient
t1 = (5.2/0.01) + 1;
t2 = (period + 5.2)/0.01 + 1;
sumx = 0;
sumy = 0;
num = 0;
den1 = 0;
den2 = 0;

for i=t1:t2
    sumx = sumx + x(i);
    sumy = sumy + y(i);
    
end

avgx = sumx/(t2-t1+1);
avgy = sumy/(t2-t1+1);

for i=t1:t2
    num = num + ((x(i) - avgx)*(y(i) - avgy));
    den1 = den1 + ((x(i) - avgx)*(x(i) - avgx));
    den2 = den2 + ((y(i) - avgy)*(y(i) - avgy));
end

rxy = num/(sqrt(den1)*sqrt(den2));
fprintf('%s %f','Pearsons linear correlation coefficient is', rxy);

%% Plot
h1 = figure(1);
plot(t, x, 'c.', t, y, 'm.');
set(gca, 'FONTSIZE', 10);
xlabel('Time [years]', 'FONTSIZE', 10);
ylabel('Popultation in Thousands', 'FONTSIZE', 10);
box on
legend({'Hare','Lynx'},'Location','northeast')
title('Populations of Lynx and Hare Over Time')
saveas(h1, 'hw4_p1.png');


