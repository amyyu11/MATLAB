% https://youtu.be/X1l6m3XU9wo

% Final Project of M20 in Fall 2019
% Genetic Algorithm
% Amy Yu 905138432
% 12/14/19

% finding joint angles needed to reach a goal point

clc; clear all; close all;

f = @fitness;
d = @decodeChromosome;
populationSize = 1001;
pCrossover = 0.8;
pMutation = 0.3;

angles = geneticAlgorithm(f, d, populationSize, pCrossover,pMutation);
fprintf('%0.4f\t', angles);

L = [0.6, 0.4, 0.3, 0.2];
x = zeros(1,4);
y = zeros(1,4);

for k=2:4
    x(k) = x(k-1) + L(k-1)*cos(angles(k-1));
    y(k) = y(k-1) + L(k-1)*sin(angles(k-1));
end

f2 = figure(2);
hold on;
grid on;
g = plot(1,1, '.r', 'MarkerSize', 40, 'DisplayName','Goal');
o1 = plot(0,0.8, '.k', 'MarkerSize', 40, 'DisplayName','Obstacles');
o2 = plot(0.5,0.4, '.k', 'MarkerSize', 40);
arm = plot(x,y, '.-b', 'MarkerSize', 40, 'LineWidth', 4, 'DisplayName','Robotic Arm');
xlim([-0.4 1.4]);
ylim([0 1.4]);
title('Configuration of Robot', 'FontSize', 12);
xlabel('X axis (m)', 'FontSize', 12);
ylabel('Y axis (m)', 'FontSize', 12);
legend([g o1 arm]);
saveas(f2, 'robot_config.jpeg');