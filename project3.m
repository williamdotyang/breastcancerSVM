mu = 5e-4;
for i = 1:29
  for j = (i+1):30
    Msubtrain = Mtrain(:,[i j]);
    Bsubtrain = Btrain(:,[i j]);
    Msubtune = Mtune(:,[i j]);
    Bsubtune = Btune(:,[i j]);
    numMissed = evaluate(mu,Msubtrain,Bsubtrain,Msubtune,Bsubtune);
    fprintf('atts %2d %2d: misclass %3d\n',i,j, numMissed);
  end
end
