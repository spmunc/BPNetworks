function [error] = calculateError(E, D)
% calculates mean squared error
    error = mean((mean((E-D).^2)));
end

