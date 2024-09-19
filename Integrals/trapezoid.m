function I = trapezoid(y, l, tol)
    n = ceil((((y-l)^3)*maxiz(l, y)/(12*tol))^0.5);
    sec = (y-l)/n;
    I = 0;
    for i=1:n-1
        I = I+funcz(l+i*sec);
    end
    I = (y-l)*(funcz(l)+2*I+funcz(y))/(2*n);
end

function f = funcz(z)
    f = sin(z)/z;
end

function f = doublederz(z)
    f = -((z^2-2)*sin(z)+2*z*cos(z))/z^3;
end

function M = maxiz(l, u)
    M = doublederz(l-1);
    for i=l:u
        fnew = doublederz(i);
        if fnew>M
            M = fnew;
        end
    end
end