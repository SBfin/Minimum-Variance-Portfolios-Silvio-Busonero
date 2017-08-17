% OLS.M
% Lutz Kilian
% University of Pennsylvania
% February 1995
%
% This program runs a univariate OLS regression and returns the coefficient
% estimates, standard errors, t-values, fitted values, residuals, estimated
% innovation variance, and coefficient variance-covariance matrix.

function [bhat,bhatstd,tbhat,yhat,ehat,sigma2,bhatcov]=ols(y,X)

% Let T=sample size and v=number of coefficients
[T,v]=size(X);

% Regression coefficients and residuals
bhat=(X'*X)\(X'*y);
yhat=X*bhat;
ehat=y-yhat;           

% Estimated variance of the disturbance term
sigma2=ehat'*ehat/(T-v);

% Variance-covariance matrix of bhat
bhatcov=sigma2*inv(X'*X);

% Read off the standard errors of bhat
bhatstd=sqrt(diag(bhatcov));

% Calculate the t values of bhat for H(0): b=0
tbhat=bhat./bhatstd;