function I = simpson(u, l, tol)
    n = ceil((((u-l)^5)*maxifourx(l, u)/(12*tol))^0.25);
    sec = (u-l)/n;
    I1 = 0;
    I2 = 0;
    for i=1:n-1
        if rem(i, 2)==0
            I2 = I2 + Q(l+i*sec);
        else
            I1 = I1 + Q(i);
        end
    end
    I = (u-l)*(Q(l)+2*I2+4*I1+Q(u))/(3*n);
end

function f = Q(t)
    f = 20+10*sin(2*pi*(t-10)/24);
end

function f = fourthderx(t)
    f = 10*(2*pi/24)^4*sin((2*pi*(t-10)/24));
end

function M = maxifourx(l, u)
    M = fourthderx(l-1);
    for i=l:u
        fnew = fourthderx(i);
        if fnew>M
            M = fnew;
        end
    end
end