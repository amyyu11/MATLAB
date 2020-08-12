function chromosomeSubpopulation = selection(chromosomePopulation, fitness, decode)
%selection Performs selection on the population using Binary Tournament selection.
    n = size(chromosomePopulation, 2);  % number of chromosomes
    chromosomeSubpopulation = uint32(n-1);
    
    for i=1:n-1
        a = ceil(rand(1)*n);
        b = ceil(rand(1)*n);
        x = decode(chromosomePopulation(a));
        y = decode(chromosomePopulation(b));
        if (fitness(x) > fitness(y))    % finds the chromosome with higher fitness score
            chromosomeSubpopulation(i) = chromosomePopulation(a);
        else
            chromosomeSubpopulation(i) = chromosomePopulation(b);
        end
    end
end
% Inputs:
%   chromosomePopulation: an array containing all the chromosomes in 
%         the optimization (array of uint32)
% fitness: function handle for evaluating the fitness of a solution
%              in the original solution space
% decode: function handle for decoding a chromosome
% Outputs:
%   chromosomeSubpopulation: a new array of chromosomes selected using
%              the Binary Tournament selection policy (array of uint32)
