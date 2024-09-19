function [x, y] = mnewt(gx, gy, tol)
    er = 10;
    iter = 0;
    while er>tol
        [u, v, J] = funcxy(gx, gy);
        xn = gx - (u*J(2, 2)-v*J(1, 2))/det(J);
        yn = gy - (v*J(1, 1) - v*J(2, 1))/det(J);
        er = max([abs(xn-gx)/abs(xn) abs(yn-gy)/abs(yn)]);
        gx = xn; gy = yn;
        iter =iter+ 1;
    end
    x = gx; y=gy;
    ans = iter
end

function [u, v, J] = funcxy(x, y)
    u = (x-4)^2+(y-4)^2-5;
    v = x^2 + y^2 - 16;
    J = zeros(2);
    J(1, 1) = 2*(x-4);
    J(1, 2) = 2*(y-4);
    J(2, 1) = 2*x;
    J(2, 2) = 2*y;
end