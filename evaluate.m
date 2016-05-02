function [numMissed errors] = evaluate(mues, Mtrain, Btrain, Mtest, Btest)
% syntax: missed = getMissed(mu, Mtrain, Btrain, Mtest, Btest)
% given a vector of tuning parameter, training sets for positive and 
% negative examples, test sets for positive and negative examples
% (features only, no class labels), fit the svm model and evaluate 
% the model accuracy on test data.

numMissed = [];
errors = [];
for idx = 1:numel(mues)
  mu = mues(idx);
  [w gamma obj] = fitModel(mu, Mtrain, Btrain);
  % evaluate accuracy on the test data
  predictM = Mtest * w - gamma;
  predictB = Btest * w - gamma;
  correctM = (predictM > 0);
  wrongM = (predictM <= 0);
  correctB = (predictB <= 0);
  wrongB = (predictB > 0);
  numMissed = [numMissed sum(wrongM)+sum(wrongB)];
  m = size(predictM,1); 
  k = size(predictB,1);
  err = (1/m)*sum(abs(predictM(find(wrongM == 1))));
  err = err + (1/k)*sum(abs(predictB(find(wrongB == 1))));
  errors = [errors err];
end
end
