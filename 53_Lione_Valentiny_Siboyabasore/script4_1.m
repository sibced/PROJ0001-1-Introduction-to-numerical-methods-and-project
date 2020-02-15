%script pour créer un vecteur tps SELON LES CONVENTIONS
format short
lim = 500; %TJR UNE CENTAINE placer ici la dernière val. du vect. temps désiré
vect_i = [0 5 0 0.3 0 0.9 0 0.7 0]; %taille doit ê = (lim/100)*2 -1 | (ex : si lim=400, 7 valeurs de Iapp)

tps = [0 100]; %on init. déjà car tjr le même vu conventions  
i=2;
while length(tps) ~= (lim/100)*2 %vu les conventions pour l'interv. de tps des impulsions
                                 %donne la taille du vect. final de tps
    tps(i+1) = tps(i) + 20;                                                                           
    impulsion = tps(i) + 100; %impulsion toutes les 100 sec 
    tps = [tps impulsion];
    i = i + 2;
end

Y = analogique(tps, vect_i); 

%n val de temps et n-1 val de iapp rentrées