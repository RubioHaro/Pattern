warning off all 
disp('Welcome to Pattern Recognition')

%Diseno de un clasificador dde distancia Euclideana

%Metiendo las clases de pertenencia 
c1=[1 2 3 2 3; 2 2 4 7 9];
c2=[3 4 7 8 9; 5 6 -1 2 3];
c3=[10 10 11 12 13; 1 7 4 -2 9];
%vector desconocido 
vector=[7;5];

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

distancia1=norm(media1-vector);
distancia2=norm(media2-vector);
distancia3=norm(media3-vector);

dist_total=[distancia1,distancia2,distancia3];
minima=min(min(dist_total));
encuentra=find(dist_total==minima);

fprintf('El vector desconocido pertenece a la clase %d\n', encuentra);


