function [hidden_delta, output_delta] = calculateDelta(hidden_vals, output_vals, V, d, slope)
% calculate the deltas used in the weight updates based on the formulas in
% CF 1/4
    [r,~] = size(hidden_vals);
    hidden_delta = zeros(r,1);
    output_delta = (transpose(d) - output_vals(:,2)).*(slope*(1-output_vals(:,2).^2));
    for i = 1:r
        hidden_delta(i,1) = slope*(1-hidden_vals(i,2).^2)*sum(V(:,i+1).*output_delta);
    end
end

