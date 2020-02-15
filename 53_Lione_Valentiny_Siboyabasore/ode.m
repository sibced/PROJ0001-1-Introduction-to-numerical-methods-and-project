%Script qui résoud le syst d'équ avec ode45
%retourne 2vect colonne
%tol err abs = 10^-6 | tol err rel = 10^3 
[T,Y] = ode45(@fctode, [0 200],[-1.5 0.5]);

plot(T,Y(:,1),'black',T,Y(:,2),'red')
title('Activité neuronale')
xlabel('temps (milliseconde) ')
ylabel('noir : tension V | rouge : perméabilité n')