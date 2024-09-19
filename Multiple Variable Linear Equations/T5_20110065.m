function [X, C] = T5_20110065(n)
    syms x(z) c(z) a
    assume(z, 'integer')
    a = zeros(2*n, 1);
    for k=1:2*n
        if rem(k,2)==0
            a(k)= -1/(k+1);
        end
        for l=1:n
            a(k) = a(k)+c(l)*(x(l)^(k-1));
        end
    end
    X = a;
end