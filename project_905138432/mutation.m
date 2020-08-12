function mutatedChromosome = mutation(chromosome, pMutation)
    r = rand(1);    % generates random number between 0 and 1
    if (r <= pMutation)
        s = r*32;
        k = ceil(s);    % random number between 1 and 32
        mask = bitset(uint32(0), k);    % start with all zeros and set a random bit
        mutatedChromosome = bitxor(chromosome, mask);   % toggles bit
    else
        mutatedChromosome = chromosome;
    end
end
%   mutation Mutates a chromosome with probability pMutation at a random gene
% Inputs:
%     chromosome: encoded 32-bit value (uint32)
%     pMutation: probability of mutation ranging from 0 to 1
% Outputs:
%     mutatedChromosome: chromosome with the random bit mutated (uint32)