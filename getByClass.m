function [X_class, Y_class] = getByClass(X,Y,k)
% Gets the X and Y by class k when Y_i is a binary vector with 1 in slot k

[~,is_class_k] = max(Y,[],2);
is_class_k = (is_class_k == k);
X_class = X(is_class_k,:);
Y_class = Y(is_class_k,:);


end

