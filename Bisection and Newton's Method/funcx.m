function f = funcx(v)
    p = 65000e+3;
    t = 223;
    p_c = 4580e+3;
    T_c = 191;
    r = 0.518e+3;
    a = 0.427*r^2*T_c^2.5/p_c;
    b = 0.0866*r*T_c/p_c;
    f = p*(v-b)*(v*(v+b)*t^0.5) - r*t*(v*(v+b)*t^0.5) + a*(v-b);
end