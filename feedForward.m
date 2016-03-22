function [hidden_vals, output_vals] = feedForward(x, W, V, slope)
% feeds 1 input through the network 
    hidden_vals = [];
    output_vals = [];
    hidden_vals(:,end+1) = W*transpose([1,x]);
    hidden_vals(:,end+1) = tanh(slope*hidden_vals(:,1));
    output_vals(:,end+1) = V*[1; hidden_vals(:,2)];
    output_vals(:,end+1) = tanh(slope*output_vals(:,1));
end
