% HW 1 Problem 1 of M20 in Fall 2019
% Flipping a string and combining two strings

% Amy Yu 905138432
% 10/8/19

clc; clear all; close all;

% Prompts user for two strings
firstString = input('Enter first string: ', 's');
secondString = input('Enter second string: ', 's');

% Prints first string
fprintf(firstString)

% Prints a space and the flipped second string
fprintf(' %s', fliplr(secondString))
