Btest = test(find(test(:,1) == 66), 2:31);
Mtest = test(find(test(:,1) == 77), 2:31);
mu = 5e-4;
idxs = [24 25];
Mtrain2 = Mtrain(:,idxs);
Btrain2 = Btrain(:,idxs);
Mtest2 = Mtest(:,idxs);
Btest2 = Btest(:,idxs);
numMissed = evaluate(mu,Mtrain2,Btrain2,Mtest2,Btest2)