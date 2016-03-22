function [deltaW, deltaV] = updateWeights(W, V, hidden_delta, hidden_vals, output_delta, x, nu)
    % calculate how much the weights should be updated based on the inputs
    % NOTE: DOESN'T ACUALLY UPDATE THE WEIGHTS
    [rv, cv] = size(V);
    [rw, cw] = size(W);
    deltaV = zeros(rv,cv);
    deltaW = zeros(rw,cw);
    
    for r = 1:rv
       deltaV(r,:) = transpose((nu*output_delta(r,1)*[1;hidden_vals(:,2)]));
    end
    
    for r = 1:rw
        deltaW(r,:) = nu*hidden_delta(r,1)*[1,x];
    end
end

