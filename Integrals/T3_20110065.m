function A = T3_20110065(e, s)
    l = length(e);
    A = s(1)*e(1);
    for i=2:l
        ad = (s(i)+s(i-1))*(e(i)-e(i-1))/2;
        A = A+ad;
    end
end