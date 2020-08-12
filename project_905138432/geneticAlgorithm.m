% Amy Yu 905138432
% 12/14/19
% geneticAlgorithm Implements the genetic algorithm optimizer
% This function will assume that selection.m, crossover.m, mutation.m,
% encodeGene.m, decodeGene.m, and fitness.m are in the same directory

function xOpt = geneticAlgorithm(fitness, decodeChromosome, populationSize, pCrossover, pMutation)
%% Save Video
% STEP 1: Create the video object for writing (MPEG-4 recommended)
% vidHandle = VideoWriter('final_video','MPEG-4');
% 
% % STEP 2: Set some video options
% vidHandle.Quality = 100;
% vidHandle.FrameRate = 1.5;
%   
% % STEP 3: Open the video file for writing and write the first frame
% open(vidHandle);
%  
% % Create a figure handle for the plot window
% figureHandle = figure();
  
    P = uint32(populationSize); % initializes array of chromosomes
    for i=1:populationSize
        P(i) = uint32(randi(4294967295));   % randomly generates uint32 
    end

    highestFitnessScore = 0;
    x = uint32(populationSize); % initializes array of chromosomes
    a = 1;  % counts number of generations
    
    while 0.99 > highestFitnessScore
        if (a < 1000)    % stops loop if does not converge after 1000 generations
            iteration(a) = a;
            pNew = selection(P, fitness, decodeChromosome);
            i = 1;
            while i <= populationSize-2
                [x(i), x(i+1)] = crossover(pNew(i), pNew(i+1), pCrossover);
                x(i) = mutation(pNew(i), pMutation); 
                i =i+2;
            end

            for j=1:populationSize-1
                theta = decodeChromosome(x(j));
                score = fitness(theta);

                if score >= highestFitnessScore
                    highestFitnessScore = score;
                    pOpt = x(j);
                end

            end
            highscore(a) = highestFitnessScore;
            P = [pOpt, x];

            fit = zeros(1, populationSize);
            for k=1:populationSize
                theta2 = decodeChromosome(P(k));
                fit(k) = fitness(theta2);
            end

    %% Creates Histogram
            h = histogram(fit,'Normalization','probability');
            title('Distribution of Chromosomes According to Normalized Fitness', 'FontSize', 12);
            xlabel('Fitness Scores', 'FontSize', 12);
            ylabel('Portion of Population', 'FontSize', 12);
            h.BinWidth = 0.05;
            grid on; 
            xlim([0 1]);
            ylim([0 1]);
            pause(0.1);
    %         writeVideo(vidHandle,getframe(figureHandle));
            a = a + 1;
        else
            break;
        end
    end
    
    xOpt = decodeChromosome(pOpt);  % decodes angles
%% Plots Max Fitness Score
    f = figure(1);
    plot(iteration, highscore, '-b');
    grid on;
    title('Max Fitness Score per Generation', 'FontSize', 12);
    xlabel('Generation Count', 'FontSize', 12);
    ylabel('Normalized Fitness Score', 'FontSize', 12);
    saveas(f, 'final_plot.jpeg');
 %% STEP 5: Close the file
%     close(vidHandle);
end

% Inputs:
%       fitness: function handle for evaluating the fitness of a solution
%                in the original solution space
%       decodeChromosome: function handle for decoding an 32-bit chromosome
%                         into a solution in the original solution space
%       populationSize: number of genes to use in the genetic algorithm
%       pCrossover: probability of crossover
%       pMutation: probability of mutation
%   Outputs:
%       xOpt: optimal solution as expressed in the solution space