%Détermine la valeur de courant Iapp à appliquer au neurone afin que 
%celui-ci produise des spikes avec une fréquence donnée en entrée

function iapp = recherche_iapp(freq)

I = 0; 
f = 0; 
h = 0.01;
f(1) = spike(I(1));

for j=2:400 %Gardien de boucle bon vu graphi.m
    
    I(j) = I(j-1) + h;
    f(j) = spike(I(j)); 
    
    if f(j) < f(j-1) %On récup toutes les fréq jusqu'à la fréq max
    break
    end
end

[freqmax, i] = max(f); %on récup la fréq max et son Iapp correspondant (son abscisse) 

%Recherche lim de Iapp a-p-d laquelle les spikes sont rég
if freq == 'limite'
    A = [I;f];
    A(: , f==0) = []; %pour toutes les val. de fréq. nulle, on  supp la colonne de A
    X = ['Spikes réguliers apd Iapp = ', num2str(A(1))]; 
    %num2str converti le nbr A(1) en chaine de caract, mise à la suite
    disp(X)
return;
end

%Erreur si la fréq. en entrée est trop grande
if freq > freqmax
    disp('Pas de valeur de courant qui produit des spikes a cette fréquence')
    return;
end 

    %Fonction : graph des freq en fct de Iapp 
    % dont les ordonnées sont diminuées d'une val de fréq en entrée
    function x = fctfreq(I)
    x = spike(I) - freq; 
    end

iapp = bissection(@fctfreq,0,I(i)); %recherche de la racine 
end 