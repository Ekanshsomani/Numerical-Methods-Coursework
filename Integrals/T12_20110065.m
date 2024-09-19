function [d1, d2, m1, m2] = T12_20110065()
    D = [0 6 10 13 17 20 28];
    S1 = [6.67 17.33 42.67 37.33 30.1 29.3 28.74];
    S2 = [6.67 16.11 18.89 15 10.56 9.44 8.89];
    [d1, d2] = Lagrange([12, 16], D, S1, S2);
    [m1, m2] = maxis(D, S1, S2);
end

function [w1, w2] = Lagrange(x, D, S1, S2)
    l = length(D);
    w1 = 0;
    w2 = 0;
    for i=1:l
        L=1;
        for j=1:l
            if j~=i
                L = L.*(x-D(j))/(D(i)-D(j));
            end
        end
        w1 = w1+S1(i)*L;
        w2 = w2+S2(i)*L;
    end
end

function [M1, M2] = maxis(D, S1, S2)
    n = length(D);
    M1 = 0;
    M2 = 0;
    for i=D(1):0.2:D(n)
        [f1, f2] = Lagrange(i, D, S1, S2);
        if f1>M1
            M1 = f1;
        end
        if f2>M2
            M2 = f2;
        end
    end
end