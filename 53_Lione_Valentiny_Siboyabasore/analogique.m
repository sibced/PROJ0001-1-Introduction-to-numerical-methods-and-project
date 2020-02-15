%Reproduit la réaction du neurone à un courant d?entrée constant par morceaux
%Retourne une matrice avec toutes les tensions mesurées

function Y = analogique(t, Iapp)
c = var_glob;
j = 1;
%conditions initiales
V(1) = c.Vi;
n(1) = c.ni;
Y = [];

for i = 1 : length(Iapp)
        y = eulexp([t(i) t(i+1)], [V(i) n(i)], Iapp(i)); %eulexp dans interv considéré avec Iapp correspondant
        V(i+1) = y(2,end); %on initialise les conditions initiales
        n(i+1) = y(3,end); 
        
        Y = [Y y]; %mat qui s'agrandi à chaque itération
end

plot(Y(1,:), Y(2,:))
title('Réaction du neurone à un courant d entrée par morceaux')
xlabel('Temps (milliseconde) ')
ylabel('Tension V')
end