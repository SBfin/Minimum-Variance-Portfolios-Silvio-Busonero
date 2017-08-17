function [ws,wm] = KMdominant( R )
%Silvio Busonero 2017 SBfin 
%this function returns the dominant estimators 1 by kemps and Memmel (2008)
%ws=ks*wr+(1-ks)wt
%where: ws are the dominant estimator weights
%wr are the weights of the reference portfolio, assumend to be EW
%ks=((d-3)/(n-d-2))*(1/tr) where d is the number of assets, n the lenght of the
%window, and tr the estimate relative loss of the reference portfolio
%tr=(sigmahat2ref-sigmahat2t)/sigmahat2t
%sigmahat2t is the variance of the traditional portfolio: 1/(iota'*inv(S)*iota)
%iota=ones(size(S,1),1);
%sigmahat2ref is the variance of the reference portfolio
[n,d]=size(R);
%Defining variance covariance matrix and the variance of the traditional
%estimator
S=cov(R);
iota=ones(size(S,1),1);
sigmahat2t=1/(iota'*inv(S)*iota);
wt(1,1:d)=(inv(S)*iota)/(iota'*inv(S)*iota);
%equal weights portfolio and its variance
wr(1,1:d)=1/d;
sigmahat2r=var(wr*R');
%tr and its relative variance
tr=(sigmahat2r-sigmahat2t)/sigmahat2t;

ks=((d-3)/(n-d-2))*(1/tr);

ws=ks*wr+(1-ks)*wt;
%wm is the modified estimator with ks restricted to assume value in (ks,1)
km=min(ks,1);
wm=km*wr+(1-km)*wt;


end

