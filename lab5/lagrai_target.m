function l = lagrai_target(z, x, i)
    n = length(z); 
    m = length(x);
    l = prod(repmat(x,1,n-1)-repmat(z([1:i-1,i+1:n]),m,1),2)/prod(z(i)-z([1:i-1,i+1:n])); 
end