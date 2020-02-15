%Question 2.1
function dy = nagumo(t,V,n,Iapp)
c = var_glob;
y = [V n]; %on crée un vecteur dont les composantes sont V et n
dy = zeros(2, 1); %on initialise une matrice de zéros qui contiendra le membre de droite du syst d'équ

%Système d'équations diff : 
dy(1) = y(1) - (y(1)^3)/3 - y(2)^2 + Iapp;
dy(2) = c.e*( 2 / ( 1+ exp(-5*y(1)))+ c.n0 - y(2));
end
