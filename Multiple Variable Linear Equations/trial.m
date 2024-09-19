function x = trial(x_est, tol)
    e = 10;
    while e>tol
        xnew = funcx(x_est);
        e = abs((xnew-x_est)/xnew);
        x_est = xnew;
    end
    x = x_est;
end

function f = funcx(x)
    f = x*((x-2)*exp(x)+x+2)/(1+(x-1)*exp(x));
end