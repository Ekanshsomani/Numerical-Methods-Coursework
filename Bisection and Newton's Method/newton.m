function x = newton(x_est, tol)
    y = func(x_est);
    while y ~= 0
        dy = dfunc(x_est);
        x_new = x_est -y/dy;
        e = abs(x_new-x_est)/abs(x_new);
        if e>tol
            y = func(x_est);
        end
    end
    x = x_est;
end

function f = func(h)
    q = 5;
    n = 0.03;
    s = 0.0002;
    b = 20;
    f = q*n*(b+2*h)^0.67-s^0.5*(b*h)^1.67;
end

function df = dfunc(h)
    q = 5;
    n = 0.03;
    s = 0.0002;
    b = 20;
    df = (4/3)*(q*n)/(b+2*h)^0.33 - (5/3)*s^0.5*b*(b*h)^0.67;
end