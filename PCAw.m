function pcaweights = PCAw( X,j )
%Silvio Busonero 2017 SBfin 
%This function returns the portfolio weights of a matrix R using PCA(j)and
%PCR method
X=standard(X);
%apply pca
X=X';
Z=pca(X);
%first j pca 
j=10;
Z=Z(:,1:j);
Z=Z';
%Z is the K*T return factor matrix
B=((Z*Z')^(-1))*(Z*X');
%compute the fitted values
ehat=X-B'*Z;
%Xhat=Z*B;
Omega=B'*(Z*Z')*B+diagonalize(ehat*ehat');
%Compute the weigths according to NOw (Numerical Optimization weight)
%function
iota=ones(size(Omega,1),1);
pcaweights=(inv(Omega)*iota)/(iota'*inv(Omega)*iota);


end

