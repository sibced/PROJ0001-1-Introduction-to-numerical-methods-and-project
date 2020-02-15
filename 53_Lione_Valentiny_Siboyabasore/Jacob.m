%Vérification du pas
%Si euler explicite est stable, renvoie 1, sinon 0
c = var_glob;
Ci = [c.Vi c.ni];
t = [0 200];
Iapp = 0.1;

%Création du jacobien, j contient les dérivées partielles
%syms V n
%j = jacobian([ (V - V^3/3 - n^2 + Iapp) ,  0.1*(2/(1 + exp(-5*V)) - n) ]);
Y = eulexp(t,Ci,Iapp);

for i=1 : length(Y)
    A(i) = 1 - (Y(2,i))^2;
    B(i) = -2*(Y(3,i));
end

%Vérification de la stabilité
checkA = abs(1+c.h*A)<1;
checkB = abs(1+c.h*B)<1 ;

if sum(checkA) == length(checkA) && sum(checkB) == length(checkB)
    disp(1)
else
    disp(0)
end
