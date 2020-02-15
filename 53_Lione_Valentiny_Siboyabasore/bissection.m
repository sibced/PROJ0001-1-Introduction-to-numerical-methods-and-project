%Recherche la racine d'une fonction approxim�e a 10^(-7)pr�s
%M�thode de la BISECTION


function rac = bissection(f,x0,x1)
erreur = 10^(-7);
text = 'Appel a la fonction s�cante car hyp non v�rifi�es';
%Formule pour determiner le nbr d'it�rations
k=(log((x1-x0)/(2*erreur)))/log(2);

%On v�rifie si les abscisses en entr�e sont d�j� les racines
if abs(f(x0))<erreur
    rac = x0;
    return;
elseif abs(f(x1))<erreur 
    rac = x1;
    return;
end

%V�rif si les ordonn�es de x1 et x2 sont de signes contraires   
if f(x0)*f(x1)>0
    rac = secante(f, x0, x1);
    disp(text)
    
else 
    %milieu de l'intervalle en entr�e
    rac = (x0 + x1)/2;
    
    %A chaque it�ration, on modifie l'intervalle
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

