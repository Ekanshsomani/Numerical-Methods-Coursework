function X=T10_20110065()
    K = [-150 50 0 0; 50 -130 80 0; 0 80 -280 200; 0 0 -200 200];
    B = [0;0;0;2000];
    X = Thomas(K, B);
end


function X = Thomas(K, B)
    n = length(B);
    X = zeros(n, 1);
    %Decomposition and Forward Substitution
    for i=2:n
        K(i,i-1)=K(i,i-1)/K(i-1, i-1);
        K(i,i)=K(i,i)-K(i,i-1)*K(i-1,i);
        B(i)=B(i)-K(i,i-1)*B(i-1);
    end
    %Back Substitution
    X(n)=B(n)/K(n,n);
    for j=n-1:-1:1
        X(j)= (B(j)-K(j,j+1)*X(j+1))/K(j,j);
    end
end