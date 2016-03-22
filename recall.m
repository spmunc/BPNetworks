function [recalled_output] = recall(W, V, X, slope)
% sends a matrix on inputs through the network 
    [r_,~] = size(X);
    recalled_output = [];
    for i = 1:r_
        x_ = X(i,:);
        [~, output_vals] = feedForward(x_, W, V, slope);
        recalled_output(end+1,:) = transpose(output_vals(:,2));
    end
    
end
