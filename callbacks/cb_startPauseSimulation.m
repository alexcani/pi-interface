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

function cb_startPauseSimulation(hObject,~)
global ad;

% Identifica o estado do bot�o (se � bot�o de iniciar ou pausar)
if strcmp(hObject.String,'Inicia') == 1
    isPause = 0;
else
    isPause = 1;
end

%% A��es a serem tomadas em outros elementos quando o bot�o � pressionado
% Alterna o texto do bot�o
if isPause == 1 % Clicou em "Pausa"
    hObject.String = 'Inicia';
    % Libera bot�o de exportar, o de limpar ainda fica travado
    set(ad.handles.bt_exportaSelecao, 'Enable', 'on');
else % Clicou em "Iniciar"
    hObject.String = 'Pausa';
    % Travar bot�o de exportar e de limpar
    set(ad.handles.bt_cleanAll, 'Enable', 'off');
    set(ad.handles.bt_exportaSelecao, 'Enable', 'off');
end

% Habilita bot�o de Parar
ad.handles.bt_paraSim.Enable = 'on';


%% Simula��o em s�
% Se clicou em iniciar, verificar se � a primeira vez ou est� despausando
if isPause == 0 % Clicou em iniciar
    if ad.pausado == 0 % Clicou em iniciar e n�o estava pausado -> primeira vez
        % Criar novo conjunto de linhas
        createLines();% Cria as linhas e j� armazena no global ad
        % Tendo as linhas, p�e pra simular
        ad.simulando = 1;
        simulate(); % Simulate sempre usa o primeiro conjunto de linhas, fica a cargo das outras fun��es reorganizar
    else % Estava pausado -> despausar
        ad.pausado = 0;
        simulate();
    end
else % Clicou em pausar
    ad.pausado = 1;
end

return