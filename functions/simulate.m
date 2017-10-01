% Universidade Federal de Santa Catarina
% Centro Tecnol�gico
% Departamento de Automa��o e Sistemas
% Autores: Alex Amadeu Cani
%          Gabriel Paiva
%          Iago de Oliveira Silvestre
%          Lu�s Artur Kretzer Tavares Sobral
% Ano/Semestre: 2017-2
% 
% Disciplina: Projeto Integrador (DAS5104)
% Kit Did�tico para Controle

function simulate(linhas)
global ad;
% Sequencia:
% - Pega estado atual
% - Simula proximo passo
% - Atualiza gr�ficos
% - Espera 0.01s
x0 = [-3; 0; 0.1; 0];
x = x0;
t = 0;
K = [0.8801 1.1557 -0.9331 -98.8855];
dt = 0.01;

while(ad.simulando == 1)
    if(ad.pausado == 1)
        pause(dt);
        continue;
    else
        % Calcula controle
        u = -K*x;
%         u = max(min(50,u), -50);
        % Simula planta
        x = x + modelo(x(1), x(2), x(3), x(4), u)*dt;
        t = t + dt;
        
        % Atualiza linhas
        posX = linhas(1);
        velX = linhas(2);
        posT = linhas(3);
        velT = linhas(4);
        atu = linhas(5);
        
        % Eixo tempo
        % Pode pegar de qualquer uma, ja que o tempo � o mesmo
        T = get(posX, 'XData');
        T = [T t];
        % Ajusta os limites da visualiza��o
        
        % Posi��o do carrinho
        aux = get(posX, 'YData');
        aux = [aux x(1)];
        set(ad.handles.axes_posCar, 'YLim', [floor(min(aux)-0.1) ceil(max(aux)+0.1)]); % Limites em Y
        set(posX, 'XData', T, 'YData', aux);
        
        % Velocidade do carrinho
        aux = get(velX, 'YData');
        aux = [aux x(2)];
        set(ad.handles.axes_velCar, 'YLim', [floor(min(aux)-0.1), ceil(max(aux)+0.1)]); % Limites em Y
        set(velX, 'XData', T, 'YData', aux);
        
        % Posi��o do p�ndulo
        aux = get(posT, 'YData');
        aux = [aux x(3)];
        set(ad.handles.axes_posPend, 'YLim', [floor(min(aux)-0.1), ceil(max(aux)+0.1)]); % Limites em Y
        set(posT, 'XData', T, 'YData', aux);
        
        % Velocidade do p�ndulo
        aux = get(velT, 'YData');
        aux = [aux x(4)];
        set(ad.handles.axes_velPend, 'YLim', [floor(min(aux)-0.1), ceil(max(aux)+0.1)]); % Limites em Y
        set(velT, 'XData', T, 'YData', aux);
        
        % Atua��o
        aux = get(atu, 'YData');
        aux = [aux u];
        set(ad.handles.axes_atuacao, 'YLim', [floor(min(aux)-0.1), ceil(max(aux)+0.1)]); % Limites em Y
        set(atu, 'XData', T, 'YData', aux);
        
        % Atualiza o modelo 2D
        update2D(x(1), x(3));
        % Espera
        pause(dt);
    end
end