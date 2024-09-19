function x = T3_20110065(x0, x1, tol)
    er = 10;
    while er>tol
        xnew = x1 - funcx(x1)*(x0-x1)/(funcx(x0)-funcx(x1));
        %{
        change all 'funcx' in the above line to 'recheck' 
        for getting the other root
        %}
        er = abs(xnew-x1)/abs(xnew);
        x0 = x1; x1 = xnew;
    end
    x = x1;
end

function f = funcx(x)
    f = 7*sin(x)-exp(1)^x;
end

function r = recheck(x)
    r = (7*sin(x)-exp(1)^x)/(x-0.1702);
end