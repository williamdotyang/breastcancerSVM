% plot
[w,gamma] = fitModel(mu,Mtrain2,Btrain2);
w1 = w(1);
w2 = w(2);
xs = linspace(-2,4,1000);
ys = (-w1/w2)*xs + gamma/w2;
plot(Mtest2(:,1),Mtest2(:,2),'+r'), hold on;
plot(Btest2(:,1),Btest2(:,2),'ob'), hold on;
plot(xs,ys)
ylim([-5 5])
legend('malignant','benign')