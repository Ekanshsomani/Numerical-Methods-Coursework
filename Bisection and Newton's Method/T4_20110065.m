function x = T4_20110065(x_est, tol)
    y = func(x_est);
    while y ~= 0
        dy = dfunc(x_est);
        x_new = x_est -y/dy;
        er = abs(x_new-x_est)/abs(x_new);
        if er<tol
            break
        end
        x_est = x_new;
        y = func(x_est);
    end
    x = x_est;
end

function f = func(x)
    f = (4-x)-2*exp(1)^(0.5*x);
end

function df = dfunc(x)
    df = -1-exp(1)^(0.5*x);
end