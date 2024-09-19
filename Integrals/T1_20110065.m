function v = T1_20110065(t5)
    T = [700 720 740 760 780];
    V = [0.0977 0.12184 0.14060 0.15509 0.16643];
    l = length(T);
    v = V(1);
    a=1;
    for i=2:l
        a = a*(t5-T(i-1));
        v = v+a*bracket(i:-1:1, T, V);
    end
end

function fb = bracket(Tc, Tg, Vg)
    l = length(Tc);
    if l==2
        fb = (Vg(Tc(1))-Vg(Tc(2)))/(Tg(Tc(1))-Tg(Tc(2)));
    else
        fb = (bracket(Tc(1:l-1), Tg, Vg) - bracket(Tc(2:l), Tg, Vg))/(Tc(1)-Tc(l));
    end
end