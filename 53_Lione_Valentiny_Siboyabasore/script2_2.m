%Script pour la Q2.2
%R�solution du syst d'�qu par Euler exp dans les conditions de base
format long
c = var_glob;
Y = eulexp([0 50],[c.Vi c.ni], 0.1);
plot(Y(1,:), Y(2,:), ' - black', Y(1,:), Y(3,:), '- red')
title('Activit� neuronale')
xlabel('temps (milliseconde) ')
ylabel('noir : tension V | rouge : perm�abilit� n')