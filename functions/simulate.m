% Universidade Federal de Santa Catarina
% Centro Tecnológico
% Departamento de Automação e Sistemas
% Autores: Alex Amadeu Cani
%          Gabriel Paiva
%          Iago de Oliveira Silvestre
%          Luís Artur Kretzer Tavares Sobral
% Ano/Semestre: 2017-2
% 
% Disciplina: Projeto Integrador (DAS5104)
% Kit Didático para Controle

function simulate()
global ad;
% Pega a linha a ser simulada
linhas = ad.linhas{1};
% Separa os elementos dos graficos
posX = linhas(1);
velX = linhas(2);
posT = linhas(3);
velT = linhas(4);

% Obtém t0
atu = linhas(5);
aux = get(atu, 'XData');
t = aux(end);

% Obtém o estado inicial
x10 = get(posX, 'YData');
x20 = get(velX, 'YData');
x30 = get(posT, 'YData');
x40 = get(velT, 'YData');
x = [x10(end); x20(end); x30(end); x40(end)];

% Temporário controle
K = [0.8801 1.1557 -0.9331 -98.8855];

% Sequencia:
% - Pega estado atual
% - Simula proximo passo
% - Atualiza gráficos
% - Espera 0.01s
dt = 0.01;
while(ad.simulando == 1 && ad.pausado == 0)
        % Calcula controle
        u = -K*(x - [ad.referencia; 0; 0; 0]);
        % Satura
%         u = max(min(50,u), -50);
        % Simula planta
        x = x + modelo(x(1), x(2), x(3), x(4), u)*dt;
        t = round(t + dt, 2);
        
        % Atualiza linhas
        
        % Eixo tempo
        % Pode pegar de qualquer uma, ja que o tempo é o mesmo
        T = get(posX, 'XData');
        T = [T t];
        % Ajusta os limites da visualização
        if t > 5
            if mod(t, 5) == 0
                lim = [t-5 t+5];
                set(ad.handles.axes_posCar, 'XLim', lim); % Limite em X
                set(ad.handles.axes_velCar, 'XLim', lim); % Limite em X
                set(ad.handles.axes_posPend, 'XLim', lim); % Limite em X
                set(ad.handles.axes_velPend, 'XLim', lim); % Limite em X
                set(ad.handles.axes_atuacao, 'XLim', lim); % Limite em X
            end
        else
            aux = [0 10];
            set(ad.handles.axes_posCar, 'XLim', aux); % Limite em X
            set(ad.handles.axes_velCar, 'XLim', aux); % Limite em X
            set(ad.handles.axes_posPend, 'XLim', aux); % Limite em X
            set(ad.handles.axes_velPend, 'XLim', aux); % Limite em X
            set(ad.handles.axes_atuacao, 'XLim', aux); % Limite em X
        end
        
%         lim = get(ad.handles.axes_posCar, 'XLim');
        % Posição do carrinho
        aux = get(posX, 'YData');
        aux = [aux x(1)];
%         pontos = aux(1+lim(1)/dt:end);
        pontos = aux(max(1, end-10/dt):end);
        set(ad.handles.axes_posCar, 'YLim', [floor(min(pontos)-0.1) ceil(max(pontos)+0.1)]); % Limites em Y
        set(posX, 'XData', T, 'YData', aux);
        
        % Velocidade do carrinho
        aux = get(velX, 'YData');
        aux = [aux x(2)];
%         pontos = aux(1+lim(1)/dt:end);
        pontos = aux(max(1, end-10/dt):end);
        set(ad.handles.axes_velCar, 'YLim', [floor(min(pontos)-0.1), ceil(max(pontos)+0.1)]); % Limites em Y
        set(velX, 'XData', T, 'YData', aux);
        
        % Posição do pêndulo
        aux = get(posT, 'YData');
        aux = [aux x(3)];
%         pontos = aux(1+lim(1)/dt:end);
        pontos = aux(max(1, end-10/dt):end);
        set(ad.handles.axes_posPend, 'YLim', [floor(min(pontos)-0.1), ceil(max(pontos)+0.1)]); % Limites em Y
        set(posT, 'XData', T, 'YData', aux);
        
        % Velocidade do pêndulo
        aux = get(velT, 'YData');
        aux = [aux x(4)];
%         pontos = aux(1+lim(1)/dt:end);
        pontos = aux(max(1, end-10/dt):end);
        set(ad.handles.axes_velPend, 'YLim', [floor(min(pontos)-0.1), ceil(max(pontos)+0.1)]); % Limites em Y
        set(velT, 'XData', T, 'YData', aux);
        
        % Atuação
        aux = get(atu, 'YData');
        aux = [aux u];
%         pontos = aux(1+lim(1)/dt:end);
        pontos = aux(max(1, end-10/dt):end);
        set(ad.handles.axes_atuacao, 'YLim', [floor(min(pontos)-0.1), ceil(max(pontos)+0.1)]); % Limites em Y
        set(atu, 'XData', T, 'YData', aux);
        
        % Atualiza o modelo 2D
        update2D(x(1), x(3));
        % Espera
        pause(dt);
    end
end