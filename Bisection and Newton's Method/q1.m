P = 65000e+3;
T = 223;
p_c = 4580e+3;
T_c = 191;
R = 0.518e+3;
a = 0.427*R^2*T_c^2.5/p_c;
b = 0.0866*R*T_c/p_c;

%Hit And Trial Method For First Few Guesses
vlow = 0;
vhigh = 0.01;
v = bisection(vlow, vhigh, 10e-8)