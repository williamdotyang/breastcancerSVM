function [w gamma obj] = fitModel(mu, Mtrain, Btrain)
% syntax: [w gamma] = fitModel(mu, Mtrain, Btrain)
% given the tuning param, training data, fit the model and output coeffs and
% the objective value for the QP. .

% formulate the QP
n = size(Btrain,2);
m = size(Mtrain,1);
k = size(Btrain,1);
Q = [mu*eye(n) zeros(n,1+m+k); zeros(1+m+k,n+1+m+k)];
p = [zeros(n+1,1); (1/m)*ones(m,1); (1/k)*ones(k,1)];
A = [-Mtrain ones(m,1) -eye(m) zeros(m,k);
     Btrain -ones(k,1) zeros(k,m) -eye(k)]; 
b = -ones(m+k,1);
lb = [-inf((n+1),1); zeros(m+k,1)];
ub = inf(n+1+m+k,1);
% solve the QP
[x obj] = cplexqp(Q,p,A,b,[],[],lb,ub);
w = x(1:n);
gamma = x(n+1);
end
