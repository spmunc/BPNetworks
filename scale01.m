function [X_scale, maxs, mins] = scale01(X)

[~,cols] = size(X);
if cols == 1
    mins = min(X);
    maxs = max(X);
    X_scale = (X - mins) ./ (maxs-mins);
    return
end


maxs = max(X,[],1);
mins = min(X,[],1);
X_scale = bsxfun(@rdivide, bsxfun(@minus,X,mins), (maxs-mins));

end

