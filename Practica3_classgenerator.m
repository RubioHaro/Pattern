clc % limpiar pantalla
close all %cierra todo
clear all %limpia todo
warning off all

menu = 1;

while menu == 1
    clc % limpiar pantalla
    showMenu();
    op = input('Please Select your classifier criteria:');
    x = 1;

    if op ~= 1 && op ~= 2 && op ~= 3 && op ~= 4
        disp('Invalid option:');
        disp(op);
        break;
    end

    % Euclidean Distance
    if op == 1

        while x == 1
            clc % limpiar pantalla
            disp('Euclidian');

            vector = askVector();

            %Metiendo las clases de pertenencia
            c1 = [1 2 3 2 3; 2 2 4 7 9];
            c2 = [3 4 7 8 9; 5 6 -1 2 3];
            c3 = [10 10 11 12 13; 1 7 4 -2 9];
            c4 = [-1 -2 -3 -2 -3; -2 -2 -4 -7 -9];
            c5 = [-4 -3 -2 -5 -3; 3 4 5 6 4];
            c6 = [3 4 5 3 6; -3 -4 -5 -7 -5];

            %Graficando las clases
            figure(1);
            plot(c1(1, :), c1(2, :), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
            grid on
            hold on
            plot(c2(1, :), c2(2, :), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 10);
            plot(c3(1, :), c3(2, :), 'ro', 'MarkerFaceColor', 'k', 'MarkerSize', 10);
            plot(c4(1, :), c4(2, :), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
            plot(c5(1, :), c5(2, :), 'mo', 'MarkerFaceColor', 'm', 'MarkerSize', 10);
            plot(c6(1, :), c6(2, :), 'yo', 'MarkerFaceColor', 'y', 'MarkerSize', 10);
            plot(vector(1, :), vector(2, :), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 10, 'Marker', 'pentagram');
            legend('clase1', 'clase2', 'clase3', 'clase4', 'clase5', 'clase6', 'vector');

            %Obteniendo parametrosmde cada clase
            media1 = mean(c1, 2);
            media2 = mean(c2, 2);
            media3 = mean(c3, 2);
            media4 = mean(c4, 2);
            media5 = mean(c5, 2);
            media6 = mean(c6, 2);

            %Clasificador dde distancia Euclideana

            distancia1 = norm(media1 - vector);
            distancia2 = norm(media2 - vector);
            distancia3 = norm(media3 - vector);
            distancia4 = norm(media4 - vector);
            distancia5 = norm(media5 - vector);
            distancia6 = norm(media6 - vector);

            dist_total = [distancia1, distancia2, distancia3, distancia4, distancia5, distancia6];
            minima = min(min(dist_total));
            encuentra = find(dist_total == minima);
            dist_max = 50;

            if minima >= dist_max
                disp('Error: max dis: ');
                disp(dist_max);
            else
                fprintf('The unknown vector belongs to class: %d\n', encuentra);
            end

            x = aksToRepeat();
        end

    end

    % Mahalanobis Distance
    if op == 2
        x = 1;

        while x == 1
            clc % limpiar pantalla
            disp('Mahalanobis')

            vector = askVector();

            %Metiendo las clases de pertenencia
            c1 = [1 2 3 2 3; 2 2 4 7 9];
            c2 = [3 4 7 8 9; 5 6 -1 2 3];
            c3 = [10 10 11 12 13; 1 7 4 -2 9];
            c4 = [-1 -2 -3 -2 -3; -2 -2 -4 -7 -9];
            c5 = [-4 -3 -2 -5 -3; 3 4 5 6 4];
            c6 = [3 4 5 3 6; -3 -4 -5 -7 -5];

            %Graficando las clases
            figure(1);
            plot(c1(1, :), c1(2, :), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
            grid on
            hold on
            plot(c2(1, :), c2(2, :), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 10);
            plot(c3(1, :), c3(2, :), 'ro', 'MarkerFaceColor', 'k', 'MarkerSize', 10);
            plot(c4(1, :), c4(2, :), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
            plot(c5(1, :), c5(2, :), 'mo', 'MarkerFaceColor', 'm', 'MarkerSize', 10);
            plot(c6(1, :), c6(2, :), 'yo', 'MarkerFaceColor', 'y', 'MarkerSize', 10);
            plot(vector(1, :), vector(2, :), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 10, 'Marker', 'pentagram');
            legend('clase1', 'clase2', 'clase3', 'clase4', 'clase5', 'clase6', 'vector');

            %Obteniendo parametrosmde cada clase
            media1 = mean(c1, 2);
            media2 = mean(c2, 2);
            media3 = mean(c3, 2);
            media4 = mean(c4, 2);
            media5 = mean(c5, 2);
            media6 = mean(c6, 2);

            clc % limpiar pantalla
            %diseño de un clasificador de distancia mahalanobis

            matrix_cov1 = (c1 - media1) * (c1 - media1)';
            inv_matrix_cov1 = inv(matrix_cov1);

            matrix_cov2 = (c2 - media2) * (c2 - media2)';
            inv_matrix_cov2 = inv(matrix_cov2);

            matrix_cov3 = (c3 - media3) * (c3 - media3)';
            inv_matrix_cov3 = inv(matrix_cov3);

            matrix_cov4 = (c4 - media4) * (c4 - media4)';
            inv_matrix_cov4 = inv(matrix_cov4);

            matrix_cov5 = (c5 - media5) * (c5 - media5)';
            inv_matrix_cov5 = inv(matrix_cov5);

            matrix_cov6 = (c6 - media6) * (c6 - media6)';
            inv_matrix_cov6 = inv(matrix_cov6);

            dist1 = (vector - media1)' * inv_matrix_cov1 * (vector - media1);
            dist2 = (vector - media2)' * inv_matrix_cov2 * (vector - media2);
            dist3 = (vector - media3)' * inv_matrix_cov3 * (vector - media3);

            dist4 = (vector - media4)' * inv_matrix_cov4 * (vector - media4);
            dist5 = (vector - media5)' * inv_matrix_cov5 * (vector - media5);
            dist6 = (vector - media6)' * inv_matrix_cov6 * (vector - media6);

            dist_total = [dist1 dist2 dist3, dist4, dist5, dist6];
            minimo = min(min(dist_total));
            encuentra = find(minimo == dist_total);

            dist_max = 50;

            if minimo >= dist_max
                disp('Error: max dis: ');
                disp(dist_max);
                disp(dist_max);
            else
                fprintf('The unknown vector belongs to class: %d\n', encuentra);
            end

            x = aksToRepeat();

            disp("End of program");
        end

    end

    % Class Generator
    if op == 3
        clc % limpiar pantalla
        disp('Class Generator');
        clases = input("How many classes do you want to generate?: ");
        rep = input("How many dots per class do you want to generate?: ");

        for i = 1:clases
            label(:, i) = strcat("Class ", int2str(i));
            centrox = input(strcat("Enter the x coordinate of the center of class ", int2str(i), ": "));
            centroy = input(strcat("Enter the y coordinate of the center of class ", int2str(i), ": "));
            dispersion = input(strcat("Enter the dispersion of class ", int2str(i), ": "));
            Arrx(i, :) = (randn(1, rep) * dispersion) + centrox;
            Arry(i, :) = (randn(1, rep) * dispersion) + centroy;
        end

        opt = 1

        while opt == 1
            vx = input("Enter the x coordinate of the vector: ");
            vy = input("Enter the y coordinate of the vector: ");

            if vx > (max(max(Arrx)) * 1.5) || vy > (max(max(Arry)) * 1.5) || vx <- (max(max(Arrx)) * 1.5) || vy <- (max(max(Arry)) * 1.5)
                disp("The vector is out of the range of the classes");
                return;
            end

            vector = [vx; vy];
            myMap = rand(clases, 3);
            option1 = 1
            while option1 < 1 || option1 > 2
                option1 = input("Select an option\n1.- Euclidean Distance\n2.- Mahalanobis Distance\nSelect: ");
            end

            if option1 == 1

                for i = 1:clases
                    medias(i, :) = mean([Arrx(i, :); Arry(i, :)], 2);
                    distancias(i) = norm([medias(i, 1); medias(i, 2)] - vector);
                end

                minima = min(min(distancias));
                posicion = find(distancias == minima);
                fprintf('the know vector belongs to the class: %d\n', posicion);
                % disp(label(posicion));
                disp(distancias);

                figure();
                grid on;
                hold on;
    
                for i = 1:clases
                    plot(Arrx(i, :), Arry(i, :), 's', 'Color', myMap(i, :), 'MarkerFaceColor', myMap(i, :), 'MarkerSize', 6);
                end
    
                plot(vector(1, :), vector(2, :), 'bd', 'MarkerFaceColor', 'b', 'MarkerSize', 6);
                label(:, (clases + 1)) = "Unknow Vector";
                legend(label(:, :), 'Location', 'northeastoutside');
            if option1 == 2

                for i = 1:clases
                    medias(i, :) = mean([Arrx(i, :); Arry(i, :)], 2);
                    matrix_cov(:, :, i) = ([Arrx(i, :); Arry(i, :)] - medias(i, :)') * ([Arrx(i, :); Arry(i, :)] - medias(i, :)')';
                    inv_matrix_cov(:, :, i) = inv(matrix_cov(:, :, i));
                    dists(i) = (vector - medias(i, :)')' * inv_matrix_cov(:, :, i) * (vector - medias(i, :)');
                end

                minima = min(min(dists));
                posicion = find(minima == dists);
                disp("the know vector belongs to the class: ");
                disp(label(posicion));
                % disp(dists);
                figure();
                grid on;
                hold on;
    
                for i = 1:clases
                    plot(Arrx(i, :), Arry(i, :), 's', 'Color', myMap(i, :), 'MarkerFaceColor', myMap(i, :), 'MarkerSize', 6);
                end
    
                plot(vector(1, :), vector(2, :), 'bd', 'MarkerFaceColor', 'b', 'MarkerSize', 6);
                label(:, (clases + 1)) = "Unknow Vector";
                legend(label(:, :), 'Location', 'northeastoutside');

            else 
                for i=1:clases
            medias(i, :) = mean([Arrx(i, :); Arry(i, :)], 2)
            matrix_cov(:, :, i) = ([Arrx(i, :); Arry(i, :)] - medias(i, :)') * ([Arrx(i, :); Arry(i, :)] - medias(i, :)')'
            inv_matrix_cov(:, :, i) = inv(matrix_cov(:, :, i))
            dato_ac(i) = 1/((2*pi)*det(matrix_cov(:,:,i))^0.5)
            dato_bc(i) = exp((-0.5)*((vector-medias(i,:)')'*inv_matrix_cov(:,:,i))*(vector-medias(i,:)'))

            prob(i) = dato_ac(:,i) * dato_bc(:,i)
        end
        for i=1:clases
            probn(i) = (prob(:,i)/sum(prob))*100;
        end
        maxima = max(probn);
        posicion = find(maxima==probn)
        fprintf('El vector desconocido pertenece a la clase %d\n', posicion);
        disp(probn)
           
            end

            

            opt = input('Repeat? (1 yes. 2 no,show the graph):');
    
            if opt ~= 1

                continue;
            end

        end
        menu = 0;
    end

    if op == 4
        clc % limpiar pantalla
        disp('Closing program...');
        menu = 0;
    end

end

function showMenu()
    disp('Welcome to Pattern Recognition');
    disp('1. Euclidian Distribution');
    disp('2. Mahalobis Distribution');
    disp('3. Class Generator');
    disp('4. Salir');
end

function x = aksToRepeat()
    pause(3);
    fprintf('1.- Yes\n');
    fprintf('2.- No (Main Menu) \n');
    x = input('Other point?: ');

    if (x ~= 1)
        x = 0;
    end

end

function vector = askVector()
    %vector desconocido
    vx = input('Please input the x of the vector: ');
    vy = input('Please input the y of the vector: ');
    vector = [vx; vy];
end

function [x, y] = generateRandNumber(elements)
    %generando las clases
    x = randn(1, elements);
    y = randn(1, elements);
    % classComponent = [x; y];
end
