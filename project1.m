% ********** 1. **********
% get data
[train, tune, test] = getdata('wdbc.data', 30);
Btrain_indicies = find(train(:,1) == 66);
Mtrain_indicies = find(train(:,1) == 77);
Btrain = train(Btrain_indicies,2:31);
Mtrain = train(Mtrain_indicies,2:31);

mu = 0.0001;
% fit the model
[w gamma obj] = fitModel(mu, Mtrain, Btrain)
