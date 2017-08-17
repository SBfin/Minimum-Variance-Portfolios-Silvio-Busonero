function w = RIDGEw( ret )
%Silvio Busonero 2017 SBfin 
%returns the weights according a Ridge inspired Loss function
lambda=0.05;
f=@(w,ret)w'*cov(ret)*w+lambda*(sum(w.^2));
[~,n]=size(ret);
ew(1:n,1)=1/n;
fun=@(w)f(w,ret);
Aeq=[ones(1,n); zeros(n-1,n)];
beq=[ones(1,1); zeros(n-1,1)];
options = optimoptions('fmincon','MaxFunctionEvaluations',12000);
w=fmincon(fun,ew,[],[],Aeq,beq,[],[],[],options);
end