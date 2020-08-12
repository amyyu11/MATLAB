% HW 3 Problem 3 of M20 in Fall 2019
% Permutation

% Amy Yu 905138432
% 10/22/19

clc; clear all; close all;

% Prompts user for the values of permutation
n = input('Enter value of n: ');

while (n < 0 || mod(n,1) ~= 0)
    fprintf('%s', 'Input must be a nonnegative integer.')
    fprintf('\n')
    n = input('Enter value of n: ');
end

r = input('Enter value of r: ');

while (r < 0 || mod(r,1) ~= 0)
    fprintf('%s', 'Input must be a nonnegative integer.')
    fprintf('\n')
    r = input('Enter value of r: ');
end


p1 = 1;
p2 = 1;

% multiply each number by the integer before it
for i=1:n
    p1 = (p1*i);
end

for j=1:(n-r)
    p2 =(p2*j);
end

% prints output as integer
fprintf('%i', (p1/p2))