function [x, p, isDiscrete] = ComputePDF(rv)
    %sorting and filtering the data
    m = size(rv, 1);
    n = size(rv, 2);

    [x, p] = counter(rv);
    [x, p] = mergesort(x, p);
    lx = length(x);
    
    %Checking Discreeteness
    if lx/(m*n) <0.5 || (x(lx)-x(1))/(m*n)>2
        isDiscrete = 1;
    else
        isDiscrete = 0;
    end
    
    %{
    %checking the discreteness with the help of continuity
    xaverage = p*x'/sum(p);
    paverage = sum(p)/lx;
    pdif = abs(p(2: lx)-p(1:lx-1))/paverage;
    xdif = 100*(x(2: lx)-x(1:lx-1))/xaverage;
    percent = nnz(heaviside(pdif - xdif))/(lx-1)*100;
    isDiscrete = heaviside(percent - 20);
    %}

    %findng pmf or pdf
    if isDiscrete
        p = p/(m*n);
    else
        %{
        diff = abs(p(1:lx-2)+p(3:lx));
        prod = x(2:lx-1)*diff';
        tot = x(lx)*(p(lx)+p(lx-1))-x(1)*(p(1)+p(2));
        area = tot + prod;
        k = abs(1/area)
        p = k*p;
        %}
        xdif = x(2:lx)-x(1:lx-1);
        psum = p(2:lx)+p(1:lx-1);
        sigma = xdif*psum';
        k = 2/sigma;
        p = k*p;
    end
end
function [x, p] = counter(rv)
    m = size(rv, 1);
    n = size(rv, 2);
    x = zeros([1 m*n]);
    p = zeros([1 m*n]);
    for i = 1:m
        for j = 1:n
            a = 'No';
            for k = 1:nnz(x)
                if rv(i, j) == x(k)
                    a = 'Yes';
                    p(k) = p(k)+1;
                    break
                end
            end
            if strcmp(a, 'No')==1
                x(nnz(x)+1) = rv(i, j);
                p(nnz(x)+1) = 1;
            end
        end
    end
    x = x(1:nnz(x));
    p = p(1:nnz(x));
end
function [r, s] = mergesort(x,p)
    n = length(x);
    if n<= 1
        r = x;
        s = p;
    elseif rem(n, 2)==0
        [r1, s1] = mergesort(x(1:n/2), p(1:n/2));
        [r2, s2] = mergesort(x(n/2 + 1: n),p(n/2+1:n));
        [r, s] = merge(r1, s1, r2, s2);
    else
        [r1, s1] = mergesort(x(1:(n-1)/2), p(1:(n-1)/2));
        [r2, s2] = mergesort(x((n+1)/2 + 1: n),p((n+1)/2+1:n));
        [r, s] = merge(r1, s1, r2, s2);
    end
end
function [x, p] = merge(x1, p1, x2, p2)
    n = length(x1) + length(x2);
    x = zeros(1, n);
    p = zeros(1, n);
    i1 = 1;
    i2 = 1;
    for i=1:n
        if i1 > length(x1)
            x(i) = x2(i2);
            p(i) = p2(i2);
            i2 = i2 + 1;
        elseif i2>length(x2)
            x(i) = x1(i1);
            p(i) = p1(i1);
            i1 = i1 + 1;
        elseif x1(i1)<x2(i2)
            x(i) = x1(i1);
            p(i) = p1(i1);
            i1 = i1 + 1;
        else
            x(i) = x2(i2);
            p(i) = p2(i2);
            i2 = i2 + 1;
        end
    end
end

