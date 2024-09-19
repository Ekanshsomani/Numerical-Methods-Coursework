function x = secant(x1, x2, tol)
    er = 10;
    while er>tol
        xnew = x2 - funcx(x2)*(x1-x2)/(funcx(x1)-funcx(x2));
        er = abs(xnew-x2)/abs(xnew);
        x1 = x2; x2 = xnew;
    end
    x = x2;
end

function f = funcx(x)
    f = -2*x^6-1.5*x^4+10*x+2;
end