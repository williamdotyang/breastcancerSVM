mu = 5e-4;
minMissed = size(Mtune,1);
for i = 1:29
  for j = (i+1):30
    Msubtrain = Mtrain(:,[i j]);
    Bsubtrain = Btrain(:,[i j]);
    Msubtune = Mtune(:,[i j]);
    Bsubtune = Btune(:,[i j]);
    numMissed = evaluate(mu,Msubtrain,Bsubtrain,Msubtune,Bsubtune);
    if numMissed < minMissed
      minMissed = numMissed;
    end
    fprintf('atts %2d %2d: misclass %3d\n',i,j, numMissed);
  end
end
minMissed
