Btune = tune(find(tune(:,1) == 66), 2:31);
Mtune = tune(find(tune(:,1) == 77), 2:31);
% evaluate the model when mu = 0.0001
[missed obj] = evaluate(mu, Mtrain, Btrain, Mtune, Btune)
% evaluate the model for different mu's
mues = 5e-5:5e-5:5e-4;
[missed errors] = evaluate(mues, Mtrain, Btrain, Mtune, Btune)
