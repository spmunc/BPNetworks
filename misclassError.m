function [error] = misclassError(E, D)
% calculates miss class error
    [rows, ~] = size(E);
    misses = 0;
    for i = 1:rows
        [~,ind1] = max(E(i,:));
        [~,ind2] = max(D(i,:));
        if ind1 ~= ind2
            misses = misses + 1;
        end
    end
    error = misses/rows;
end
