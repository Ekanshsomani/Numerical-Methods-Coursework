function [xn, xm, itern, iterm] = T4_20110065(p0, tol, maxiter)
    %Using Normal Newton Method
    [xn, pn, itern] = newt(p0, tol, maxiter);
    [nlambda1, nlambda2] = conv(pn, 0);
    %Using Modified Newton Method
    [xm, pm, iterm] = modnewt(p0, tol, maxiter);
    [mlambda1, mlambda2] = conv(pm, 0);
    figure
    hold on
    plot(nlambda1)
    plot(nlambda2)
    legend('nlambda1', 'nlambda2')
    figure
    hold on
    plot(mlambda1)
    plot(mlambda2)
    legend('mlambda1', 'mlambda2')
end

function [f, ff, fff] = fx(x)
    f = exp(x)-x-1;
    ff = exp(x)-1;
    fff = exp(x);
end

function [x, p, niter] = newt(p0, tol, maxiter)
    er = 10;
    niter = 0;
    p = zeros(1, maxiter);
    while er>tol && niter<maxiter
        niter = niter+1;
        p(niter) = p0;
        [fp, ffp] = fx(p0);
        p1 = p0 - fp/ffp;
        er = abs((p1-p0)/p1);
        p0 = p1;
    end
    x = p0;
end

function [lambda1, lambda2] = conv(p, x)
    n = length(p);
    denom = p(1:n-1)-x;
    num = p(2:n)-x; 
    lambda1 = num./denom; 
    lambda2 = num./(denom.^2);
end

function [x, p, niter] = modnewt(p0, tol, maxiter)
    er = 10;
    niter = 0;
    p = zeros(1, maxiter);
    while er>tol && niter<maxiter
        niter = niter+1;
        p(niter) = p0;
        [fp, ffp, fffp] = fx(p0);
        p1 = p0 - (fp*ffp)/(ffp^2-fp*fffp);
        er = abs((p1-p0)/p1);
        p0 = p1;
    end
    x = p0;
end 