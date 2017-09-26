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
if isPause
    hObject.String = 'Inicia';
else
    hObject.String = 'Pausa';
end

% Habilita bot�o de Parar
ad.handles.bt_paraSim.Enable = 'on';


%% Simula��o em s�
% Se clicou em iniciar, verificar se � a primeira vez ou est� despausando
if isPause == 0 % Clicou em iniciar
    if ad.pausado == 0 % Clicou em iniciar e n�o estava pausado -> primeira vez
        % Criar novo conjunto de linhas
        linhas = createLines(); % linhas � um struct de handles para as lines dos gr�ficos e o estado atual do modelo
    else % Estava pausado -> despausar
        linhas = retrieveLines(); % Pega as linhas mais recentes para continuar a simula��o
    end
    
    % Tendo as linhas, p�e pra simular
    simulate(linhas); % Linhas j� inclui os handles E o estado do modelo
else % Clicou em pausar
    ad.pausado = 1;
end

return