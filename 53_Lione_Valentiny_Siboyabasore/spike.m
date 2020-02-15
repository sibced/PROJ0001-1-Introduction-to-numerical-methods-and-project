 %Question 3.1
%Entr�e : val d'un courant Iapp
%Renvoie la fr�q si spikes r�g, sinon 0

function f = spike(Iapp)
format long
T = [0 800];
c = var_glob;
C = [c.Vi c.ni];

Y = eulexp(T, C, Iapp); %Matrice avec les val. renvoy�es par eulexp
it = round((T(2)-T(1))/c.h)-1; % -1 car i+1 ds boucle
absmax = 0;
ordmax = 0;
p=0;


for i=2:it
        %Recherche des max. locaux
        if Y(2, i)>Y(2, i-1) && Y(2, i)>Y(2, i+1) 
        p=p+1;
        absmax(p) = Y(1, i);
        ordmax(p) = Y(2, i);
        end
end

% V�rification de la p�riodicit�
a = abs(diff(ordmax)) < 0.03 ;

if p>1 && sum(a) >= length(ordmax)-2 %on tol�re que 1 max soit diff�rent (-1 pr la diff, -1 pr la tol) 
  
periode = diff(absmax);
f = 1/(mean(periode))*10^3; %Moyenne des p�riodes pr + de pr�cision

else
f = 0;
end

%plot(Y(1,:), Y(2,:))
%title('Spikes')
%xlabel('Temps (milliseconde) ')
%ylabel('Tension V')
end