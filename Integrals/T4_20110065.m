function [Eit, Eis, Sit, Sis] = T4_20110065(x, z, tol)
    Eit = trapezoidE(1000, x, tol);
    Eis = simpsonE(1000, x, tol);
    Sit = trapezoidS(z, 0.1, tol);
    Sis = simpsonS(z, 0.1, tol);
end

function I = trapezoidE(u, l, tol)
    n = ceil((((u-l)^3)*maxix(l, u)/(12*tol))^0.5);
    if n>1000
        n=1000;
    end
    sec = (u-l)/n;
    I = 0;
    for i=1:n-1
        I = I+funcx(l+i*sec);
    end
    I = (u-l)*(funcx(l)+2*I+funcx(u))/(2*n);
end

function f = funcx(x)
    f = exp(-x)/x;
end

function f = doublederx(x)
    f = exp(-x)*(x^2+2*x+2)/x^3;
end

function M = maxix(l, u)
    M = doublederx(l-1);
    for i=l:u
        fnew = doublederx(i);
        if fnew>M
            M = fnew;
        end
    end
end

function I = simpsonE(y, l, tol)
    n = ceil((((y-l)^5)*maxifourX(l, y)/(12*tol))^0.25);
    if n>1000
        n=1000;
    end
    sec = (y-l)/n;
    I1 = 0;
    I2 = 0;
    for i=1:n-1
        if rem(i, 2)==0
            I2 = I2 + funcx(l+i*sec);
        else
            I1 = I1 + funcx(l+i*sec);
        end
    end
    
    I = (y-l)*(funcx(l)+2*I2+4*I1+funcx(y))/(3*n);
end

function f = fourthderx(x)
    f = exp(-x)*(x^4+4*x^3+12*x^2+24*x+24)/x^5;
end

function M = maxifourX(l, u)
    M = fourthderx(l-1);
    for i=l:u
        fnew = fourthderx(i);
        if fnew>M
            M = fnew;
        end
    end
end

function I = trapezoidS(y, l, tol)
    n = ceil((((y-l)^3)*maxiz(l, y)/(12*tol))^0.5);
    if n>1000
        n=1000;
    end
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

function I = simpsonS(y, l, tol)
    n = ceil((((y-l)^5)*maxifourz(l, y)/(12*tol))^0.25);
    if n>1000
        n=1000;
    end
    sec = (y-l)/n;
    I1 = 0;
    I2 = 0;
    for i=1:n-1
        if rem(i, 2)==0
            I2 = I2 + funcz(l+i*sec);
        else
            I1 = I1 + funcz(l+i*sec);
        end
    end
    
    I = (y-l)*(funcz(l)+2*I2+4*I1+funcz(y))/(3*n);
end

function f = fourthderz(z)
    f = (4*z*(z^2-6)*cos(z)+(z^4-12*z^2+24)*sin(z))/z^5;
end

function M = maxifourz(l, u)
    M = fourthderz(l-1);
    for i=l:u
        fnew = fourthderz(i);
        if fnew>M
            M = fnew;
        end
    end
end