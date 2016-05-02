function [numMissed objs] = evaluate(mues, Mtrain, Btrain, Mtest, Btest)
% syntax: missed = getMissed(mu, Mtrain, Btrain, Mtest, Btest)
% given a vector of tuning parameter, training sets for positive and 
% negative examples, test sets for positive and negative examples
% (features only, no class labels), fit the svm model and evaluate 
% the model accuracy on test data.

numMissed = [];
objs = [];
for idx = 1:numel(mues)
  mu = mues(idx);
  [w gamma obj] = fitModel(mu, Mtrain, Btrain);
  objs = [objs; obj];
  % evaluate accuracy on the test data
  predictM = Mtest * w - gamma;
  predictB = Btest * w - gamma;
  correctM = (predictM > 0);
  wrongM = (predictM <= 0);
  correctB = (predictB <= 0);
  wrongB = (predictB > 0);
  numMissed = [numMissed sum(wrongM)+sum(wrongB)];
end
end
