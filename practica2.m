clc % limpiar pantalla
close all %cierra todo
clear all %limpia todo
warning off all 

disp('Welcome to Pattern Recognition');
menu = 1;

while menu == 1
    clc % limpiar pantalla
    showMenu()
    op=input('Please Select your classifier criteria:');
    x = 1;

    if op ~= 1 && op ~= 2
        disp('Invalid option')
        break;
    end 

    if op == 1

        while x ==1;
        clc % limpiar pantalla
        disp('Euclidian')

        vector = askVector();
    
            %Metiendo las clases de pertenencia 
            c1=[1 2 3 2 3; 2 2 4 7 9];
            c2=[3 4 7 8 9; 5 6 -1 2 3];
            c3=[10 10 11 12 13; 1 7 4 -2 9];
            c4=[-1 -2 -3 -2 -3; -2 -2 -4 -7 -9];
            c5=[-4 -3 -2 -5 -3; 3 4 5 6 4];
            c6=[3 4 5 3 6; -3 -4 -5 -7 -5];
        
            %Graficando las clases 
            figure(1);
            plot(c1(1, :),c1(2, :),'ro','MarkerFaceColor','r','MarkerSize', 10);
            grid on
            hold on
            plot(c2(1, :),c2(2, :),'bo','MarkerFaceColor','b','MarkerSize', 10);
            plot(c3(1, :),c3(2, :),'ro','MarkerFaceColor','k','MarkerSize', 10);
            plot(c4(1,:),c4(2,:),'go','MarkerFaceColor','g','MarkerSize', 10);
            plot(c5(1,:),c5(2,:),'mo','MarkerFaceColor','m','MarkerSize', 10);
            plot(c6(1,:),c6(2,:),'yo','MarkerFaceColor','y','MarkerSize', 10);
            plot(vector(1,:),vector(2,:),'go','MarkerFaceColor','g','MarkerSize', 10, 'Marker','pentagram');
            legend('clase1','clase2','clase3','clase4','clase5','clase6','vector');
        
            %Obteniendo parametrosmde cada clase
            media1=mean(c1,2);
            media2=mean(c2,2);
            media3=mean(c3,2);
            media4=mean(c4,2);
            media5=mean(c5,2);
            media6=mean(c6,2);
            
        

        %Clasificador dde distancia Euclideana

        distancia1=norm(media1-vector);
        distancia2=norm(media2-vector);
        distancia3=norm(media3-vector);
        distancia4=norm(media4-vector);
        distancia5=norm(media5-vector);
        distancia6=norm(media6-vector);

        dist_total=[distancia1,distancia2,distancia3,distancia4,distancia5,distancia6];
        minima=min(min(dist_total));
        encuentra=find(dist_total==minima);
        dist_max = 50;
        if minima >= dist_max 
            disp('Error: max dis: ');
            disp(dist_max);
        else
            fprintf('The unknown vector belongs to class: %d\n',encuentra);
        end

        x = aksToRepeat();
    end
    end
    if op == 2
        x = 1;
        while x ==1
        clc % limpiar pantalla
        disp('Mahalanobis')


            vector = askVector();
    
            %Metiendo las clases de pertenencia 
            c1=[1 2 3 2 3; 2 2 4 7 9];
            c2=[3 4 7 8 9; 5 6 -1 2 3];
            c3=[10 10 11 12 13; 1 7 4 -2 9];
            c4=[-1 -2 -3 -2 -3; -2 -2 -4 -7 -9];
            c5=[-4 -3 -2 -5 -3; 3 4 5 6 4];
            c6=[3 4 5 3 6; -3 -4 -5 -7 -5];
        
            %Graficando las clases 
            figure(1);
            plot(c1(1, :),c1(2, :),'ro','MarkerFaceColor','r','MarkerSize', 10);
            grid on
            hold on
            plot(c2(1, :),c2(2, :),'bo','MarkerFaceColor','b','MarkerSize', 10);
            plot(c3(1, :),c3(2, :),'ro','MarkerFaceColor','k','MarkerSize', 10);
            plot(c4(1,:),c4(2,:),'go','MarkerFaceColor','g','MarkerSize', 10);
            plot(c5(1,:),c5(2,:),'mo','MarkerFaceColor','m','MarkerSize', 10);
            plot(c6(1,:),c6(2,:),'yo','MarkerFaceColor','y','MarkerSize', 10);
            plot(vector(1,:),vector(2,:),'go','MarkerFaceColor','g','MarkerSize', 10, 'Marker','pentagram');
            legend('clase1','clase2','clase3','clase4','clase5','clase6','vector');
        
            %Obteniendo parametrosmde cada clase
            media1=mean(c1,2);
            media2=mean(c2,2);
            media3=mean(c3,2);
            media4=mean(c4,2);
            media5=mean(c5,2);
            media6=mean(c6,2);

            clc % limpiar pantalla
            %diseño de un clasificador de distancia mahalanobis
    
            matrix_cov1=(c1-media1)*(c1-media1)';
            inv_matrix_cov1=inv(matrix_cov1);
    
            matrix_cov2=(c2-media2)*(c2-media2)';
            inv_matrix_cov2=inv(matrix_cov2);
    
            matrix_cov3=(c3-media3)*(c3-media3)';
            inv_matrix_cov3=inv(matrix_cov3);
    
            matrix_cov4=(c4-media4)*(c4-media4)';
            inv_matrix_cov4=inv(matrix_cov4);
    
            matrix_cov5=(c5-media5)*(c5-media5)';
            inv_matrix_cov5=inv(matrix_cov5);
    
            matrix_cov6=(c6-media6)*(c6-media6)';
            inv_matrix_cov6=inv(matrix_cov6);
                
    
            dist1=(vector-media1)'*inv_matrix_cov1*(vector-media1);
            dist2=(vector-media2)'*inv_matrix_cov2*(vector-media2);
            dist3=(vector-media3)'*inv_matrix_cov3*(vector-media3);

            dist4=(vector-media4)'*inv_matrix_cov4*(vector-media4);
            dist5=(vector-media5)'*inv_matrix_cov5*(vector-media5);
            dist6=(vector-media6)'*inv_matrix_cov6*(vector-media6);
    
            dist_total=[dist1 dist2 dist3,dist4,dist5,dist6 ];
            minimo=min(min(dist_total));
            encuentra=find(minimo==dist_total);
    
            dist_max = 50;
            if minimo >= dist_max 
                disp('Error: max dis: ');
            disp(dist_max);
                disp(dist_max);
            else
                fprintf('The unknown vector belongs to class: %d\n',encuentra);
            end
    
            x = aksToRepeat();
    
            disp('fin de proceso...')
        end
        end
    if op == 3
        menu = 0;
    else
        disp('Invalid Option');
    end
end


function showMenu()
    disp('1. Euclidian Distribution');
    disp('2. Mahalobis Distribution');
    disp('3. Salir');
end

function x = aksToRepeat()
    pause(3);
    fprintf('1.- Yes\n');
    fprintf('2.- No (Main Menu) \n');
    x=input('Other point?: ');
    if (x~=1)
        x=0;
    end
end

function vector = askVector()
    %vector desconocido
    vx=input('Please input the x of the vector: ');
    vy=input('Please input the y of the vector: ');
    vector=[vx;vy];
end

%%// %generando las clases 
%%// c1x = randn(1,1000);
%%// c1y = randn(1,1000);
%%
%%
%%// %generando las clases 
%%// c2x = randn(1,1000)+5;
%%// c2y = randn(1,1000)+7;
%%
%%
%%// %generando las clases 
%%// c3x = (randn(1,1000)-5) * 2;
%%// c3y = (randn(1,1000)+7) * 3;
%%
%%// figure(1)
%%// plot(c1x(1, :),c1y(1, :),'ro','MarkerFaceColor','r','MarkerSize', 10);
%%// grid on
%%// hold on
%%
%%// plot(c2x(1, :),c2y(1, :),'go','MarkerFaceColor','k','MarkerSize', 10);
%%// plot(c3x(1, :),c3y(1, :),'bo','MarkerFaceColor','b','MarkerSize', 10);
%%// legend('clase1', 'clase2', 'clase3');
%%
%%// disp("fin de proceso");



