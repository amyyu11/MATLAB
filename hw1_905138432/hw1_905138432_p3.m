% HW 1 Problem 3 of M20 in Fall 2019
% Value of cos(11) and sin(11)

% Amy Yu 905138432
% 10/8/19

clc; clear all; close all;

% cs = cos(60)
cs = 0.5;

% cs2 = cos(16)
cs2 = 0.96126169593;

% s = sin(60)
s = sqrt(1-(cs*cs));

% s2 = sin(16)
s2 = sqrt(1-(cs2*cs2));

% cos(-16) = cos(16)
% sin(-16) = -sin(16)
% cs3 = cos(60-16) = cos(44) = cos(60)cos(-16)-sin(60)sin(-16)
cs3 = (cs*cs2)-(s*-s2);

% x = cos(44/2) = cos(22)
x = sqrt((1+cs3)/2);

% ans1 = cos(22/2) = cos(11)
ans1 = sqrt((1+x)/2);

% ans2 = sin(22/2) = sin(11)
ans2 = sqrt((1-x)/2);

fprintf('cos(11) = %6.6f\n',ans1)
fprintf('sin(11) = %6.6f',ans2)
