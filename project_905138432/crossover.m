% Amy Yu 905138432
% 12/14/19
% crossover Performs crossover on two chromosomes with a probability pCrossover

function [daughter1, daughter2] = crossover(chromosome1, chromosome2, pCrossover)
   r = rand(1); % generates random number between 0 and 1
   if (r <= pCrossover)
       s = r*32;
       prob = ceil(s); % random number between 1 and 32
       
       mask1 = bitshift(intmax('uint32'), -prob);   % fills first part with zeros
       part1a = bitand(chromosome1, mask1);
       mask2 = bitcmp(mask1, 'uint32');     % opposite of first mask
       part2a = bitand(chromosome2, mask2);

       part1b = bitand(chromosome2, mask1);
       part2b = bitand(chromosome1, mask2);

       daughter1 = bitor(part1a, part2a);
       daughter2 = bitor(part1b, part2b);
   else
       daughter1 = chromosome1;
       daughter2 = chromosome2;
   end
end

%   Inputs
%       chromosome1: first chromosome (uint32) to crossover
%       chromosome2: second chromosome (uint32) to crossover
%       pCrossover: crossover probability ranging from 0 to 1
%   Outputs:
%       daughter1: first daughter chromosome (uint32)
%       daughter2: second daughter chromosome (uint32)