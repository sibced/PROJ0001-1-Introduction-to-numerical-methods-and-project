%Fonction entrée tension mesurée sur membrane du neurone 
%Renvoie en sortie un message digital composé de 0 et de 1

function message = digital(tensions) 
c = var_glob; %structures avec les variables globales

Ci = [c.VV c.nn];

Iapp = 0:0.01:10;%recherche des Iapp sur cet interval
tol = 0.01;

vect_iapp = []; %contient les Iapp déterminés
message = []; %contient le message digital correspondant

k = 1; %Indice de vect_iapp

for i = 1: length(tensions)/(100/c.h)-1 %nbr de Iapp correspondant aux spikes
    
    for j=1:length(Iapp) %Pour toutes les valeurs de iapp
        
        Y = eulexp([i*100 i*100+20], Ci, Iapp(j)); 
        
        % Check si la V max renvoyé par Eulexp ds l'interv de tps courant
        % est = à la V max des tensions mesurées en entrée ds le mê interv
        check = abs( max( Y(2,:) ) - max( tensions(i*100/c.h : i*100/c.h + 20/c.h) ) ) < tol;
        
        %pour t = [100 120] et h=0.1 -> tensions[1000:1200] contient la 1e
        %valeur de Iapp à renvoyer
        
        if check == 1 %Les max sont les mêmes
            vect_iapp(k) = Iapp(j);
            k = k+1;
            break
        end
        
    end
  
%Nouvelles conditions initiales après impulsion (ex : en t=120)
Ci(1) = Y(2, end);
Ci(2) = Y(3, end);

%Nouvelles conditions initiales avant impulsion suivante (ex : en t=200)
m = eulexp([i*100+20 (i+1)*100], Ci, 0); %Iapp = 0 vu conventions
Ci(1) = m(2, end);
Ci(2) = m(3, end);
end


for i = 1:length(vect_iapp)
    
    if spike(vect_iapp(i)) ~= 0 %Si spike renvoie une fréqu. (non nul) avec la val de Iapp considérée
        message(i) = 1;
    else 
        message(i) =0;
    end 
end 
format short
disp(vect_iapp)
end