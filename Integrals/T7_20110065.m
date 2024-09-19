function t = T7_20110065(x)
    t = Lagrange(x);
    X = [0 2 4 6 8];
    T = [100 85 70 55 40];
    figure
    hold on
    fplot(@(x) Lagrange(x), [-1 9]);
    plot(X, T,'.')
end

function t = Lagrange(x)
    X = [0 2 4 6 8];
    T = [100 85 70 55 40];
    l = length(X);
    t = 0;
    for i=1:l
        L=1;
        for j=1:l
            if j~=i
                L = L.*(x-X(j))/(X(i)-X(j));
            end
        end
        t = t+T(i)*L;
    end
end