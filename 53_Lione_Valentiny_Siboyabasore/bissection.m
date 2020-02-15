%Recherche la racine d'une fonction approximée a 10^(-7)près
%Méthode de la BISECTION


function rac = bissection(f,x0,x1)
erreur = 10^(-7);
text = 'Appel a la fonction sécante car hyp non vérifiées';
%Formule pour determiner le nbr d'itérations
k=(log((x1-x0)/(2*erreur)))/log(2);

%On vérifie si les abscisses en entrée sont déjà les racines
if abs(f(x0))<erreur
    rac = x0;
    return;
elseif abs(f(x1))<erreur 
    rac = x1;
    return;
end

%Vérif si les ordonnées de x1 et x2 sont de signes contraires   
if f(x0)*f(x1)>0
    rac = secante(f, x0, x1);
    disp(text)
    
else 
    %milieu de l'intervalle en entrée
    rac = (x0 + x1)/2;
    
    %A chaque itération, on modifie l'intervalle
    for i= 0:k
        if f(rac)*f(x1)>0
            x1 = rac;
        else 
            x0 = rac;
        end
        rac = (x0 + x1)/2;
    end  
 
end

end

