% HW 2 Problem 1 of M20 in Fall 2019
% Takes date as input and returns day of week

% Amy Yu 905138432
% 10/15/19

clc; clear all; close all;

a = input('Please enter the year as YYYY (e.g. 2008): ');

% Checks if year is valid
if (a < 0001 || a > 9999)
    error('Invalid input.')
end

% Checks if it is a leap year
is_leap = mod(a, 4) == 0 ...
    && mod(a, 100) ~= 0 || ...
    mod(a, 400) == 0;

b = input('Please enter the month as MMM (e.g. FEB): ', 's');
% Makes all the letters of the month uppercase
b = upper(b);

% Assigns the month a numerical value
switch (b)
    case 'JAN'
        month = 1;
    case 'FEB'
        month = 2;
    case 'MAR'
        month = 3;
    case 'APR'
        month = 4;
    case 'MAY'
        month = 5;
    case 'JUN'
        month = 6;
    case 'JUL'
        month = 7;
    case 'AUG'
        month = 8;
    case 'SEP'
        month = 9;
    case 'OCT'
        month = 10;
    case 'NOV'
        month = 11;
    case 'DEC'
        month = 12;
    otherwise 
        error('Invalid input.')
end

day = input('Please enter the day as DD (e.g. 06): ');

% Checks if the day is valid
if (month == 2)
    if (is_leap == true && (day < 0 || day > 29))
        error('Invalid input.')
    elseif (is_leap == false && (day < 0 || day > 28))
        error('Invalid input.')
    end
    
elseif (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
    if (day < 0 || day > 31)
        error('Invalid input.')
    end
else
    if (day < 0 || day > 30)
        error('Invalid input.')
    end 
end


% Subtracts one from the month if Jan or Feb for use in the formula
if (month == 1 || month == 2)
    newYear = a-1;
else
    newYear = a;
end

m = mod((month + 9), 12) + 1;
c = floor(newYear/100);
y = mod(newYear, 100);

w = mod(day+floor(2.6*m-0.2)+y+floor(y/4)+floor(c/4)-(2*c), 7);

% Assigns each numerical value a day of the week
switch (w)
    case 0
        dayName = 'Sunday';
    case 1
        dayName = 'Monday';
    case 2
        dayName = 'Tuesday';
    case 3
        dayName = 'Wednesday';
    case 4
        dayName = 'Thursday';
    case 5
        dayName = 'Friday';
    case 6 
        dayName = 'Saturday';
end

fprintf('%s %02d %04d %s %s', b, day, a, 'is a', dayName, '.')
if (w == 0 || w == 6)
    fprintf('\n%s', 'Yay, it is a weekend!')
end
