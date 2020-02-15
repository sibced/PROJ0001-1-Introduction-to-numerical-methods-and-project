%Recherche la racine d'une fonction approxim�e � 10^(-7)pr�s
%M�thode de la SECANTE

function rac = secante(f, x0, x1)
erreur = 1; %On initialise arbitrairement l'erreur � 1.
tol = 10^(-7);

%On v�rifie si les abscisses en entr�e sont d�j� les racines
if abs(f(x0)) < tol
    rac = x0;
    return;
elseif abs(f(x1)) < tol
    rac = x1;
    return;
end

for i = 0:300
    if i+1>300
        rac = 'Pas de racines trouv�es';
        return;     
    end
    
    if erreur > tol %On s'arr�te lorsque l'erreur est inf�rieure a 10^(-7)
    fx1 = f(x1);
    u = x1 - (fx1*(x1-x0))/(fx1-f(x0)); %formule vue au cours th�orique 
    %pour trouver l'abscisse du pt d'intersection entre D(x0,x1) et le graph
        
        %On se prot�ge du cas o� on divise par 0
        if abs(u) == inf 
            rac = 'Pas de racines trouv�es';
            return;
        end
        
    erreur = abs(f(u)); %l'erreur devient l'ordonn�e du nouveau x
    x0 = x1;
    x1 = u;
    else
        rac=u; %on passe par u pour s'assurer que la fonction ne retourne une valeur x que si la fonction trouve une racine 
     return;
    end
end
end 
    
