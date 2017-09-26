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

function cb_startPauseSimulation(hObject,~)
global ad;

% Identifica o estado do botão (se é botão de iniciar ou pausar)
if strcmp(hObject.String,'Inicia') == 1
    isPause = 0;
else
    isPause = 1;
end

%% Ações a serem tomadas em outros elementos quando o botão é pressionado
% Alterna o texto do botão
if isPause
    hObject.String = 'Inicia';
else
    hObject.String = 'Pausa';
end

% Habilita botão de Parar
ad.handles.bt_paraSim.Enable = 'on';


%% Simulação em sí
% Se clicou em iniciar, verificar se é a primeira vez ou está despausando
if isPause == 0 % Clicou em iniciar
    if ad.pausado == 0 % Clicou em iniciar e não estava pausado -> primeira vez
        % Criar novo conjunto de linhas
        linhas = createLines(); % linhas é um struct de handles para as lines dos gráficos e o estado atual do modelo
    else % Estava pausado -> despausar
        linhas = retrieveLines(); % Pega as linhas mais recentes para continuar a simulação
    end
    
    % Tendo as linhas, põe pra simular
    simulate(linhas); % Linhas já inclui os handles E o estado do modelo
else % Clicou em pausar
    ad.pausado = 1;
end

return