function x = bisection(xl, xu, tol)
    fl = funcx(xl);
    fu = funcx(xu);
    if fl*fu>0
        error("Sign Does Not Change. Enter Different Input")
    elseif fl==0
        x=xl;
    elseif fu==0
        x=xu;
    else
        e = abs(xu-xl)/abs(xu);
        while e>tol
            xr = 0.5*(xu+xl);
            fr = funcx(xr);
            if fr==0
                x = xr;
                break
            elseif fl*fr<0
                xu = xr;
            else
                xl = xr;
            end
            e = abs(xu-xl)/abs(xu);
        end
        x = xr;
    end
end