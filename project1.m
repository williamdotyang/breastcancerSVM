% ********** 1. **********
% get data
[train, tune, test] = getdata('wdbc.data', 30);
Btrain = train(find(train(:,1) == 66), 2:31);
Mtrain = train(find(train(:,1) == 77), 2:31);
mu = 0.0001;
% fit the model
[w gamma obj] = fitModel(mu, Mtrain, Btrain)
