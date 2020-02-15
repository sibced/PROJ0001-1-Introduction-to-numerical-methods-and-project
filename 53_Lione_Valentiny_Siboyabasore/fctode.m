%"Copie" de nagumo pour ode
function dy = fctode(t,y)
Iapp= 1;
c = var_glob;

dy = zeros(2, 1);
ninf = 2 / (1+ exp(-5*y(1)));
dy(1) = y(1) - (y(1)^3)/3 - y(2)^2 + Iapp;
dy(2) = c.e*(ninf + c.n0 - y(2));
end
