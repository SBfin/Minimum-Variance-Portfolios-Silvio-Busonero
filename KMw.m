function weights = KMw( ret )
%Silvio Busonero 2017 SBfin 
%Kemps Memmel regression Weights
%ret is the matrix of returns
[t,n]=size(ret);
X=ones(t,1);
for i=2:n
    X=[X, ret(:,1)-ret(:,i)];
end
bhat=ols(ret(:,1),X);
bhat=bhat(2:end);
weights(1)=1-sum(bhat);
weights(2:n)=bhat;
weights=weights';
end

