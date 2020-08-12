% HW 2 Problem 2 of M20 in Fall 2019
% Neighbor Identification

% Amy Yu 905138432
% 10/15/19

clc; clear all; close all;

M = input('Enter number of rows in the array: ');
N = input('Enter number of columns: ');

% Check if M and N are valid
if (M < 3 || N < 3 || mod(M, 1) ~= 0 || mod(N, 1) ~= 0)
    error('M or N must be greater than or equal to 3.');
end

P = input('Enter cell to find neighbors: ');

is_wall = false;

% Check if P is valid
if (mod(P, 1) ~= 0 || P < 1 || P > M*N)
    error('P is not in the array.')
end

% Left wall
if (P <= M)
    if (P == 1)
        fprintf('%d %d %d\n', 2, (1+M),(2+M))
        is_wall = true;
    elseif (P == M)
        fprintf('%d %d %d\n', M-1, 2*M-1, 2*M)
        is_wall = true;
    else
        fprintf('%d %d %d %d %d\n', P-1, P+1, P+M, P+M-1, P+M+1)
        is_wall = true;
    end
end

% top wall
if (mod(P, M) == 1 && P ~= 1 && P ~= (M*N-M+1))
    is_wall = true;
    fprintf('%d %d %d %d %d\n', P+M, P-M, P-M+1, P+1, P+M+1)
end

% bottom wall
if (mod(P, M) == 0 && P ~= M && P ~= M*N)
    is_wall = true;
    fprintf('%d %d %d %d %d\n', P-M, P-M-1, P-1, P+M, P+M-1)
end

% right wall
if (P > M*N-M)
    if (P == M*N-M+1)
        is_wall = true;
        fprintf('%d %d %d\n', P-M, P-M+1,P+1)
    elseif (P == M*N)
        is_wall = true;
        fprintf('%d %d %d\n', P-M, P-M-1, P-1)
    else 
        is_wall = true;
        fprintf('%d %d %d %d %d\n', P-1, P+1, P-M, P-M-1, P-M+1)
    end
end

% all others
if (is_wall == false)
    fprintf('%d %d %d %d %d %d %d %d', P-1, P+1, P-M, P+M, P-M-1, P-M+1, P+M-1, P+M+1)
end

% Checks if P is corner node
if (P == 1 || P == M || P == M*N || P == (M*N)-M+1)
    fprintf('Corner node')
end