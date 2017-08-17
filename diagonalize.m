function A= diagonalize( v )
%return a diagonal matrix with the diagonal of v in the diagonal position;
%the other elements are set to 0
n=length(v);
for i=1:n
    A(i,:)=[zeros(1,i-1),v(i), zeros(1,n-i)];
end

end

