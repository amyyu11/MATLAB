% HW 1 Problem 2 of M20 in Fall 2019
% Approximations of the perimeter of an ellipse

% Amy Yu 905138432
% 10/8/19

clc; clear all; close all;

% Prompts user for the values of the semiaxes of the ellipse
a = input('Enter value of a: ');
b = input('Enter value of b: ');

% h is a departure from circlehood
h = ((a-b)/(a+b))*((a-b)/(a+b));

% methods one through eight are saved in variables
p1 = pi*(a+b);
p2 = pi*sqrt(2*((a*a)+(b*b)));
p3 = pi*sqrt(2*((a*a)+(b*b))-(((a-b)*(a-b))/2));
p4 = pi*(a+b)*((1+(h/8))*(1+h/8));
p5 = pi*(a+b)*(1+((3*h)/(10+sqrt(4-(3*h)))));
p6 = pi*(a+b)*((64-3*h*h)/(64-16*h));
p7 = pi*(a+b)*((256-48*h-21*h*h)/(256-112*h+3*h*h));
p8 = pi*(a+b)*((3-sqrt(1-h))/2);

% A and B are matrices used to print the results
A = [p1 p2 p3 p4];
B = [p5 p6 p7 p8];

% prints with four digits after decimal point
fprintf('%4.4f\t', A)
fprintf('\n')
fprintf('%4.4f\t', B)



