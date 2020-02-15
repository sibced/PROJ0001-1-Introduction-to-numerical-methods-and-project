%Question 2.2
%Méthode d'Euler explicite pour résoudre le système d'équations diff
function Y = eulexp(T, C, Iapp)
c = var_glob;%appelle la structure de variales globales

%On place les valeurs initiales dans les matrices
V(1) = C(1); 
n(1) = C(2);

t = T(1):c.h:T(2)-c.h; %On crée un vecteur qui correspond au temps, à l'axe des abscisses

for i = 1:length(t)-1 %correspond au nbr d'itérations a effectuer
    
    y = nagumo(t(i), V(i), n(i), Iapp); %nagumo calcule le mbr de dr du syst pour chaque val de t
    V(i+1) = V(i) + c.h*y(1); %calcul des itérés selon la théorie
    n(i+1) = n(i) + c.h*y(2);
end
Y = [t;V;n]; %matrice 1è ligne ; val de t | 2è : val de V | 3è : val de n
end