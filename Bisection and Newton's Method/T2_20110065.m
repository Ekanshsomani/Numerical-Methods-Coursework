function [fix, newt] = T2_20110065(X, g, tol)
    fix = fixediteration(X, g, tol);
    newt = newton(X, g, tol);
end

function fix = fixediteration(X, g1, tol) %g1 is the first guess
    error = 1000;
    count = 0;
    while error>tol || count<1000
        g = fixedx(g1, X);
        error = abs(g-g1)/abs(g);
        g1 = g; count = count+1;
    end
    fix = g1;
end

function x = newton(X, x_est, tol)
    [y, dy] = newtx(x_est, X);
    while y ~= 0
        x_new = x_est - y/dy;
        e = abs(x_new-x_est)/abs(x_new);
        if e<tol
            break
        end
        x_est = x_new;
        [y, dy] = newtx(x_est, X);
    end
    x = x_est;
end

function fx = fixedx(x, A)
    fx = 0.5*(A/x + x);
end

function [nx, nnx] = newtx(x, X)
    nx = x*x - X;
    nnx = 2*x;
end