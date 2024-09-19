function [X1, X2] = T9_20110065()
    A =[9 0 -1 0; 1 0 -3 2; 0 1 2 -7; 0 9 0 -1];
    B = [96;-80;0;4];
    [X1, X2] = pivoting(A, B);
    check = [A*X1, A*X2, B]
end

function [X1, X2] = pivoting(A, B)
    n = length(A);
    for i=1:n
        m = max(abs(A(i,:)));
        A(i,:)=A(i,:)/m;
        B(i) = B(i)/m;
    end
    for j=1:n
        [~, idx] = max(abs(A(:,j)));
        K = A(idx, :);
        L = B(idx, :);
        A(idx, :) = [];
        B(idx, :) = [];
        if j<=idx
            A = [A(1:j-1,:); K; A(j:end,:)];
            B = [B(1:j-1,:); L; B(j:end, :)];
        else
            A = [A(1:j-2,:); K; A(j-1:end,:)];
            B = [B(1:j-2,:); L; B(j-1:end,:)];
        end
    end
    X1 = elimination(A, B);
    X2 = iteration(A, B, 10e-3);
end

function X = elimination(A, B)
    n = length(A);
    for i=1:n-1
        for j=i+1:n
            A(j,:)= A(j,:)-A(i,:)*A(j,i)/A(i,i);
            B(j,:)= B(j,:)-B(i,:)*A(j,i)/A(i,i);
        end
    end
    X = substitution(A, B);
end

function X = substitution(A, B)
    n=length(A);
    X = zeros(n, 1);
    X(n)=B(n)/A(n,n);
    for j=n-1:-1:1
        X(j) = B(j);
        for i=n:-1:j+1
            X(j)=X(j)-A(j,i)*X(i);
        end
        X(j)=X(j)/A(j, j);
    end
end

function X = iteration(A, B, tol)
    n = length(A);
    X = zeros(n, 1);
    Xnew = zeros(n, 1);
    er = 10;
    while er>tol
        Xnew(1) = B(1)-A(1,2:end)*X(2:end)/(A(1,1));
        for i=2:n-1
            Xnew(i) = B(i)-(A(i,i+1:end)*X(i+1:end)+A(i,1:i-1)*X(1:i-1))/(A(i, i));
        end
        Xnew(n) = B(n)-A(n,1:n-1)*X(1:n-1)/(A(n, n));
        er = max(abs((Xnew-X)./Xnew));
        X = Xnew;
    end
end