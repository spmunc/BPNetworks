function [W, V] = initializeWeights(input_PEs, hidden_PEs, output_PEs)

    % Generate a matrix of random weights going into the hidden layer
    %   One row for each PE and 1 column for each input + 1 for bias
    W = random('uniform',-.1,.1,hidden_PEs,1 + input_PEs);
    % Generate a matrix of random weights going into the ouput layer
    %   One row for each PE and 1 column for each hidden PE + 1 for bias
    V = random('uniform',-.1,.1,output_PEs,1 + hidden_PEs);

end
