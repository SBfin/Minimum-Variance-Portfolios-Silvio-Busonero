function w = LASSOw( ret )
%Silvio Busonero 2017 SBfin 
lambda=0.1;
f=@(w,ret)w'*cov(ret)*w+lambda*sum(abs(w));
[~,n]=size(ret);
ew(1:n,1)=1/n;
fun=@(w)f(w,ret);
Aeq=[ones(1,n); zeros(n-1,n)];
beq=[ones(1,1); zeros(n-1,1)];
options = optimoptions('fmincon','MaxFunctionEvaluations',12000);
w=fmincon(fun,ew,[],[],Aeq,beq,[],[],[],options);
end