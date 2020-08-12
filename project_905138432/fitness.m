% Amy Yu 905138432
% 12/14/19
% fitness Evaluates the normalized fitness score of a solution

function score = fitness(theta)
    % given values
    L = [0.6, 0.4, 0.3, 0.2];
    
    % goal point
    xg = 1;
    yg = 1;
    
    % array for obstacles
    xo = zeros(1,2);    
    yo = zeros(1,2);
    xo(1) = 0;
    yo(1) = 0.8;
    xo(2) = 0.5;
    yo(2) = 0.4;
    
    % array for center of mass
    xc = zeros(1,4);
    yc = zeros(1,4);
    x = zeros(1,4);
    y = zeros(1,4);
    x(1) = 0;
    y(1) = 0;
    
    % joint locations
    for k=2:4
        x(k) = x(k-1) + L(k-1)*cos(theta(k-1));
        y(k) = y(k-1) + L(k-1)*sin(theta(k-1));
    end
    
    % center of mass
    for i=1:4
        xc(i) = x(i) + (L(i)/2)*cos(theta(i));
        yc(i) = y(i) + (L(i)/2)*sin(theta(i));
    end
   
    % end point
    xe = L(1)*cos(theta(1)) + L(2)*cos(theta(2)) + L(3)*cos(theta(3)) + L(4)*cos(theta(4));
    ye = L(1)*sin(theta(1)) + L(2)*sin(theta(2)) + L(3)*sin(theta(3)) + L(4)*sin(theta(4));
    
    fg = sqrt((xg-xe)^2 + (yg-ye)^2);
    
    fo = 0;
    for i=1:4
        for j=1:2
            fo = fo + sqrt((xo(j)-xc(i))^2 + (yo(j)-yc(i))^2);
        end
    end
           
    % normalized score
    score = 1 - fg - ((5.1730 - fo)/5.1730);    
end

% Inputs:
% theta: array of link angles, theta1-theta4
% Outputs:
% score: a normalized score, score should be in the range [-inf,1]