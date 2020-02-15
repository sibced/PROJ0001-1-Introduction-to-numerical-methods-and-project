%Graph qui montre les fr�qu. en fct des diff val de Iapp

Iapp = 0;
h = 0.01;
Y = 0;

for j=2:400

    Iapp(j) = Iapp(j-1) + h;
    Y(j) = spike(Iapp(j));

    %if Y(j) < Y(j-1)
    %break
    %end
    
end

plot(Iapp(1,:), Y(1,:));
title('Fr�quence des spikes en fonction du Iapp')
xlabel('Iapp')
ylabel('Fr�quence')

[frequ, i] = max(Y);
disp(Iapp(i)) %Iapp maximum qui produit des spikes r�g avec un sens physique


A = [Iapp;Y];
A(: , Y==0) = [];
disp(A(1)) %limite de Iapp a-p-d laquelle les spikes sont r�g