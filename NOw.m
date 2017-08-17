function weights = NOw( ret )
%Silvio Busonero 2017 SBfin 
%this function returns the weights applying the quadratic programming procedure
[t,n]=size(ret);
%Shrinkage matrix
sigma=cov(ret);
f=zeros(n,1);
% A=eye(n)*-1;
% b=zeros(n,1);
A=eye(n);
b=abs(ones(n,1)*0.1);
Aeq=[ones(1,n); zeros(n-1,n)];
beq=[ones(1,1); zeros(n-1,1)];
weights=quadprog(sigma,f,[],[],Aeq,beq);

end

