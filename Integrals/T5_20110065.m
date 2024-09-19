function I = T5_20110065(y, l, tol)
    n = ceil((((y-l)^5)*maxifourx(l, y)/(12*tol))^0.25);
    sec = (y-l)/n;
    I1 = 0;
    I2 = 0;
    for i=1:n-1
        if rem(i, 2)==0
            I2 = I2 + funcx(l+i*sec);
        else
            I1 = I1 + funcx(i);
        end
    end
    
    I = (y-l)*(funcx(l)+2*I2+4*I1+funcx(y))/(3*n);
end

function f = funcx(x)
    f = 78.48*(1-exp(-0.125*x));
end

function f = fourthderx(x)
    f = 0.01916*exp(-0.125*x);
end

function M = maxifourx(l, u)
    M = fourthderx(l-1);
    for i=l:0.1:u
        fnew = fourthderx(i);
        if fnew>M
            M = fnew;
        end
    end
end