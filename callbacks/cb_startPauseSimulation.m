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
if isPause == 1 % Clicou em "Pausa"
    hObject.String = 'Inicia';
    % Libera botão de exportar, o de limpar ainda fica travado
    set(ad.handles.bt_exportaSelecao, 'Enable', 'on');
else % Clicou em "Iniciar"
    hObject.String = 'Pausa';
    % Travar botão de exportar e de limpar
    set(ad.handles.bt_cleanAll, 'Enable', 'off');
    set(ad.handles.bt_exportaSelecao, 'Enable', 'off');
end

% Habilita botão de Parar
ad.handles.bt_paraSim.Enable = 'on';


%% Simulação em sí
% Se clicou em iniciar, verificar se é a primeira vez ou está despausando
if isPause == 0 % Clicou em iniciar
    if ad.pausado == 0 % Clicou em iniciar e não estava pausado -> primeira vez
        % Criar novo conjunto de linhas
        createLines();% Cria as linhas e já armazena no global ad
        % Tendo as linhas, põe pra simular
        ad.simulando = 1;
        simulate(); % Simulate sempre usa o primeiro conjunto de linhas, fica a cargo das outras funções reorganizar
    else % Estava pausado -> despausar
        ad.pausado = 0;
        simulate();
    end
else % Clicou em pausar
    ad.pausado = 1;
end

return