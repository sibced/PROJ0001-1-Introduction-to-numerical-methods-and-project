%D�termine la valeur de courant Iapp � appliquer au neurone afin que 
%celui-ci produise des spikes avec une fr�quence donn�e en entr�e

function iapp = recherche_iapp(freq)

I = 0; 
f = 0; 
h = 0.01;
f(1) = spike(I(1));

for j=2:400 %Gardien de boucle bon vu graphi.m
    
    I(j) = I(j-1) + h;
    f(j) = spike(I(j)); 
    
    if f(j) < f(j-1) %On r�cup toutes les fr�q jusqu'� la fr�q max
    break
    end
end

[freqmax, i] = max(f); %on r�cup la fr�q max et son Iapp correspondant (son abscisse) 

%Recherche lim de Iapp a-p-d laquelle les spikes sont r�g
if freq == 'limite'
    A = [I;f];
    A(: , f==0) = []; %pour toutes les val. de fr�q. nulle, on  supp la colonne de A
    X = ['Spikes r�guliers apd Iapp = ', num2str(A(1))]; 
    %num2str converti le nbr A(1) en chaine de caract, mise � la suite
    disp(X)
return;
end

%Erreur si la fr�q. en entr�e est trop grande
if freq > freqmax
    disp('Pas de valeur de courant qui produit des spikes a cette fr�quence')
    return;
end 

    %Fonction : graph des freq en fct de Iapp 
    % dont les ordonn�es sont diminu�es d'une val de fr�q en entr�e
    function x = fctfreq(I)
    x = spike(I) - freq; 
    end

iapp = bissection(@fctfreq,0,I(i)); %recherche de la racine 
end 