function [W, V, errors, errors_test, iters] = trainNetwork(X, D, input_PEs, hidden_PEs, output_PEs, slope, nu, epoch, N, test, D_t, alpha, stopping)
%trainNetwork actually trains the network with the given inputs
%   trainNetwork also calculates errors on training and test data
    iters = N;
    errors = [];
    errors_test = [];
    [rows,~] = size(X);
    % generate initial weights
    [W, V] = initializeWeights(input_PEs, hidden_PEs, output_PEs);
    lastUpdateV = 0;
    lastUpdateW = 0;
    for i = 1:N
        % zero matrices to be added to by each input in this epoch
        dV = V*0;
        dW = W*0;
        % Generate indices of the rows that will be used for this epoch
        rand_rows = unidrnd(rows, 1, epoch);
        for j = 1:epoch
            % for each row in this epoch, feed forward and calculate the
            % update based on that input
            row = rand_rows(1,j);
            x = X(row,:);
            d = D(row,:);
            [hidden_vals, output_vals] = feedForward(x, W, V, slope);
            [hidden_delta, output_delta] = calculateDelta(hidden_vals, output_vals, V, d, slope);
            [dw, dv] = updateWeights(W, V, hidden_delta, hidden_vals, output_delta, x, nu);
            dV = dV + dv;
            dW = dW + dw;
        end
        dV = dV./epoch;
        dW = dW./epoch;
        tempV = dV;
        tempW = dW;
        dV = dV + alpha*lastUpdateV;
        dW = dW + alpha*lastUpdateW;
        % average the updates 
        V = V + dV;
        W = W + dW;
        % reset last update
        lastUpdateV = tempV;
        lastUpdateW = tempW;
        % caculate errors such that there are 200 total calculated
        if mod(i,100) == 0
            recalled_output = ((recall(W, V, X, slope)));
            error_ = calculateError(recalled_output,D);
            errors(end+1) = error_;
            recalled_output = recall(W, V, test, slope);
            errors_test(end+1) = calculateError(recalled_output,D_t);
            if errors(end) < stopping
                iters = i
                return
            end
        end
    end
end