warning off all 
clc;
disp('Welcome to Pattern Recognition')

%Diseno de un clasificador dde distancia Euclideana

%Metiendo las clases de pertenencia 
c1=[1 2 3 2 3; 2 2 4 7 9];
c2=[3 4 7 8 9; 5 6 -1 2 3];
c3=[10 10 11 12 13; 1 7 4 -2 9];
%vector desconocido 
vector=[0;0];

%Graficando las clases 
figure(1)
plot(c1(1, :),c1(2, :),'ro','MarkerFaceColor','r','MarkerSize', 10)
grid on
hold on
plot(c2(1, :),c2(2, :),'bo','MarkerFaceColor','b','MarkerSize', 10)
plot(c3(1, :),c3(2, :),'ro','MarkerFaceColor','k','MarkerSize', 10)
plot(vector(1,:),vector(2,:),'go','MarkerFaceColor','g','MarkerSize', 10)
legend('clase1','clase2','clase3','vector')

%Obteniendo parametrosmde cada clase
media1=mean(c1,2);
media2=mean(c2,2);
media3=mean(c3,2);

trix_cov1 = (c1 - media1) * (c1 - media1)';
% Los representantes de la clase 1 menos la media 1;
inv_matrix = inv(trix_cov1);
% Invertimo la matriz


trix_cov2 = (c2 - media2) * (c2 - media2)';
% Los representantes de la clase 1 menos la media 1;
inv_matrix2 = inv(trix_cov2);
% Invertimo la matriz


trix_cov3 = (c3 - media3) * (c3 - media3)';
% Los representantes de la clase 1 menos la media 1;
inv_matrix3 = inv(trix_cov3);
% Invertimo la matriz


dist1 = (vector - media1)' * inv_matrix * (vector -media1);
dist2 = (vector - media2)' * inv_matrix2 * (vector -media2);
dist3 = (vector - media3)' * inv_matrix3 * (vector -media3);

distTotal = [dist1 dist2 dist3];
minimo = min(distTotal);
dato1 = find(minimo == distTotal);
fprintf('El vector desconocido pertenece a la clase %d\n', dato1);
disp("fin de proceso")


