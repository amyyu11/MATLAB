% HW 2 Problem 3 of M20 in Fall 2019
% Quadratic function

% Amy Yu 905138432
% 10/15/19

clc; clear all; close all;

L = input('Enter L: ');
R = input('Enter R: ');

if (L > R)
    error('Please make sure L is less than R.')
end

a = input('Enter a: ');

if (a == 0)
    fprintf('a should not be zero for a quadratic function.')
    fprintf('\n')
    a = input('Enter another value for a: ');
end

b = input('Enter b: ');
c = input('Enter c: ');

left_val = (a*L*L)+(b*L)+c;
right_val = (a*R*R)+(b*R)+c;

% parabola points upward
if (a > 0)
    min_x = -b/(2*a);
    min_val = (a*min_x*min_x)+(b*min_x)+c;
    
    if (min_x < L || min_x > R)
        if (left_val < right_val)
            min_val = left_val;
        else
            min_val = right_val;
        end
    end
    
    if (left_val > right_val)
        max_val = left_val;
    else
        max_val = right_val;
    end
    
% parabola points downward
elseif (a < 0)
    max_x = -b/(2*a);
    max_val = (a*max_x*max_x)+(b*max_x)+c;
    
    if (max_x < L || max_x > R)
        if (left_val > right_val)
            max_val = left_val;
        else
            max_val = right_val;
        end
    end
    
     if (left_val < right_val)
        min_val = left_val;
    else
        min_val = right_val;
    end
end

fprintf('minimum value = %1.2f\n', min_val)
fprintf('maximum value = %1.2f', max_val)