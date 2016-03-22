function [cv_folds] = get4CVFolds(nrows)
% Generate a nrows x 4 matrix of CVFolds for a matrix with nrows


inds = 1:nrows;
N = nrows/4;
fold1 = datasample(inds,N,'Replace',false)';
fold2 = datasample(inds(setdiff(inds,fold1)),N,'Replace',false)';
fold3 = datasample(inds(setdiff(inds,[fold1,fold2])),N,'Replace',false)';
fold4 = setdiff(inds,[fold1,fold2,fold3])';
cv_folds = [fold1,fold2,fold3,fold4];


end

