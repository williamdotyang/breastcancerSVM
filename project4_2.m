Btest = test(find(test(:,1) == 66), 2:31);
Mtest = test(find(test(:,1) == 77), 2:31);
mu = 5e-4;
idxs = [24 25];
numMissed = evaluate(mu,Mtrain(:,idxs),Btrain(:,idxs),Mtest(:,idxs),Btest(:,idxs))