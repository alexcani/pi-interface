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

function hf = buildInterface(tag)
scz = get(0, 'ScreenSize'); % Tamanho da tela

% Figura principal
hf = figure('Tag', tag,...
	'Toolbar','none',...
	'MenuBar','none',...
	'Units','pixels',...
    'OuterPosition', [0 0 1344 700],... % 	'OuterPosition', [0 0 scz(3)*0.98 scz(4)*0.87],...
	'Units','normalized',...
	'Resize','off',...
	'IntegerHandle','off',...
    'NumberTitle','off',...
    'HandleVisibility','callback',...
    'Name','Interface',...
    'CloseRequestFcn',@cb_closeMainWindow,...
    'Visible','off');

%% Cria o painel Controle
hcontrole = uipanel('Parent', hf,...
    'Units','normalized',...
    'Position',[0.005 0.56 0.14 0.435],...
    'Title','Controle',...
    'BackgroundColor',get(hf,'Color'),...
    'HandleVisibility','callback',...
    'Tag','painelControlador');

% Texto Controlador
uicontrol('Parent',hcontrole,...
    'Style','text',...
    'Units','normalized',...
    'FontWeight', 'bold',...
    'Position',[0 0.9 1 0.06],...
    'BackgroundColor',get(hf,'Color'),...
    'String','Tipo de Controlador',...
    'HandleVisibility','callback');

% Buttongroup p escolha do tipo de controlador
hbgcontrolador = uibuttongroup('Parent',hcontrole,...
    'Units','normalized',...
    'Position',[0.03 0.83 0.94 0.07],...
    'BackgroundColor',get(hf,'Color'),...
    'HandleVisibility','callback',...
    'BorderType', 'none',...
    'SelectionChangedFcn', @cb_controllerTypeChanged);%

uicontrol(hbgcontrolador, 'Style','radiobutton',...
    'Units','normalized',...
    'Position',[0 0 0.5 1],...
    'String','Pr�-definido',...
    'UserData', 'pre',...
    'Backgroundcolor',get(hf,'Color'),...
    'HandleVisibility','callback');

uicontrol(hbgcontrolador, 'Style','radiobutton',...
    'Units','normalized',...
    'Position',[0.5 0 0.5 1],...
    'String','Personalizado',...
    'UserData', 'custom',...
    'Backgroundcolor',get(hf,'Color'),...
    'HandleVisibility','callback');

%% Cria o painel Simula��o
hsim = uipanel('Parent', hf,...
    'Units','normalized',...
    'Position',[0.005 0.26 0.14 0.295],...
    'Title','Simula��o',...
    'BackgroundColor',get(hf,'Color'),...
    'HandleVisibility','callback',...
    'Tag','painelSimulacao');

% Bot�es
textos = {'Inicia','Para','Perturba Carrinho', 'Perturba P�ndulo'}; % Textos dos bot�es (Bot�o para � o mesmo bot�o do continua depois)
positions = [0.765 0.53, 0.25 ,0.05];
tags = {'bt_iniciaSim','bt_paraContinuaSim', 'bt_perturbaCarro', 'bt_perturbaPend'};
callbacks = {@cb_startSimulation, @cb_stopContinueSimulation, @cb_disturbCart, @cb_disturbPend};
enabled ={'On','off', 'off', 'off'};
x = [];
for index = 1:length(textos)
    x = [x uicontrol('Parent',hsim,...
        'Style','pushbutton',...
        'Units','normalized',...
        'Position',[0.15 positions(index) 0.7 0.17],...
        'BackgroundColor',get(hf,'Color'),...
        'String',textos{index},...
        'Enable',enabled{index},...
        'HandleVisibility','callback',...
        'Callback',callbacks{index},...
        'Tag',tags{index})];
end

% Checkbox tempo real ou nao
check = uicontrol(hsim,...
    'Style','checkbox',...
    'Units','normalized',...
    'Position',[0.15 0.41 1 0.15],...
    'BackgroundColor',get(hf,'Color'),...
    'String','Simular em tempo real',...
    'Value', 1,...
    'HandleVisibility','callback');

check.Position = [check.Position(1) check.Position(2) check.Position(3) check.Extent(4)+0.001];

align([x check], 'None', 'Distribute');
clear x;
%% Cria o painel da Planta F�sica
hplanta = uipanel('Parent', hf,...
    'Units','normalized',...
    'Position',[0.005 0.005 0.14 0.25],...
    'Title','Planta',...
    'BackgroundColor',get(hf,'Color'),...
    'HandleVisibility','callback',...
    'Tag','painelSimulacao');

%% Cria o painel da visualiza��o 2D

h3d = uipanel('Parent', hf,...
    'Units','normalized',...
    'Position',[0.15 0.56 0.845 0.435],...
    'Title','Visualiza��o',...
    'BackgroundColor',get(hf,'Color'),...
    'HandleVisibility','callback');

% Cria os eixos da visualiza��o
ha_visu = axes('Parent',h3d,...
    'HandleVisibility','callback',...
    'Unit','normalized',...
    'Position',[0.03 0.1 0.96 0.85],...
    'Xlim',[-5 105],...
    'YLim',[-45 15],...
    'XMinorTick', 'on',...
    'DataAspectRatioMode', 'auto');
grid(ha_visu,'on');
box(ha_visu,'on');

%% Painel com a visualiza��o das vari�veis (n�o tem um 'Panel')
alturas = 0.115;

% Posi��o do carrinho
ha_posX = axes('Parent',hf,...
    'HandleVisibility','callback',...
    'Unit','normalized',...
    'Position',[0.185 0.41 0.3775 alturas],...
    'Xlim',[0 10],...
    'YLim',[-0.7 1],...
    'TitleFontSizeMultiplier', 0.9,...
    'LabelFontSizeMultiplier', 0.9);
title(ha_posX,'Posi��o do Carrinho');
ylabel(ha_posX,'Posi��o [cm]');
grid(ha_posX,'on');
box(ha_posX,'on');

% Posi��o do p�ndulo
ha_posTheta = axes('Parent',hf,...
    'HandleVisibility','callback',...
    'Unit','normalized',...
    'Position',[0.185 0.375 0.3775 alturas],...
    'Xlim',[0 10],...
    'YLim',[-0.7 1],...
    'TitleFontSizeMultiplier', 0.9,...
    'LabelFontSizeMultiplier', 0.9);
title(ha_posTheta,'Posi��o do P�ndulo');
ylabel(ha_posTheta,'Posi��o [rad]');
grid(ha_posTheta,'on');
box(ha_posTheta,'on');

% Atua��o
ha_atuacao = axes('Parent',hf,...
    'HandleVisibility','callback',...
    'Unit','normalized',...
    'Position',[0.185 0.06 0.3775 alturas],...
    'Xlim',[0 10],...
    'YLim',[-0.7 1],...
    'TitleFontSizeMultiplier', 0.9,...
    'LabelFontSizeMultiplier', 0.9);
title(ha_atuacao,'Atua��o');
ylabel(ha_atuacao,'Tens�o [% V]');
xlabel(ha_atuacao, 'Tempo [s]');
grid(ha_atuacao,'on');
box(ha_atuacao,'on');

align([ha_posX ha_posTheta ha_atuacao], 'None', 'Distribute')


% Velocidade do carrinho
ha_velX = axes('Parent',hf,...
    'HandleVisibility','callback',...
    'Unit','normalized',...
    'Position',[0.6125 ha_posX.Position(2) 0.3775 alturas],...
    'Xlim',[0 10],...
    'YLim',[-0.7 1],...
    'TitleFontSizeMultiplier', 0.9,...
    'LabelFontSizeMultiplier', 0.9);
title(ha_velX,'Velocidade do Carrinho');
ylabel(ha_velX,'Velocidade [cm/s]');
grid(ha_velX,'on');
box(ha_velX,'on');

% Velocidade do p�ndulo
ha_velTheta = axes('Parent',hf,...
    'HandleVisibility','callback',...
    'Unit','normalized',...
    'Position',[0.6125 ha_posTheta.Position(2) 0.3775 alturas],...
    'Xlim',[0 10],...
    'YLim',[-0.7 1],...
    'TitleFontSizeMultiplier', 0.9,...
    'LabelFontSizeMultiplier', 0.9);
title(ha_velTheta,'Velocidade do P�ndulo');
ylabel(ha_velTheta,'Velocidade [rad/s]');
xlabel(ha_velTheta, 'Tempo [s]');
grid(ha_velTheta,'on');
box(ha_velTheta,'on');

%% Painel de controle das exibi��es (exportar, hold, etc)
% Bot�o exportar selecionados
uicontrol('Parent',hf,...
    'Style','pushbutton',...
    'Units','normalized',...
    'Position',[0.585 0.107 0.09 0.07],...
    'BackgroundColor',get(hf,'Color'),...
    'String','Exportar Selecionados',...
    'Enable','on',...
    'HandleVisibility','callback',...
    'Callback',@cb_exportSelection,...
    'Tag','bt_exportaSelecao');

% Checkboxes com as op��es
textos = {'Posi��o do Carrinho','Posi��o do P�ndulo', 'Velocidade do Carrinho','Velocidade do P�ndulo','Atua��o'}; % Textos dos bot�es (Bot�o para � o mesmo bot�o do continua depois)
largura = 0.1;
positions = [0 1 2 0 1]*(largura+0.005) + ones(1,5)*0.68;
altura_offset = 0.147;
altura = 0.02;
alturas = [altura_offset altura_offset altura_offset altura_offset-altura-0.01 altura_offset-altura-0.01];
tags = {'check_posCar','check_velCar','check_posPend','check_velPend','check_Atuacao'};
for index = 1:length(textos)
i = uicontrol(hf,...
    'Style','checkbox',...
    'Units','normalized',...
    'Position',[positions(index) alturas(index) largura altura],...
    'BackgroundColor',get(hf,'Color'),...
    'String',textos{index},...
    'Value', 1,...
    'HandleVisibility','callback',...
    'Tag',tags{index});
end

% Texto caixinha do nome
texto = uicontrol(hf,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.585 0.07 0.1 0.015],...
    'BackgroundColor',get(hf,'Color'),...
    'String','Exportar como:' ,...
    'HorizontalAlignment', 'left',...
    'HandleVisibility','callback');
texto.Position(4) = texto.Extent(4);

% Caixinha com o nome
uicontrol(hf,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.585+texto.Extent(3) 0.0775 0.15 0.025],...
    'BackgroundColor',get(hf,'Color'),...
    'String','resultados' ,...
    'HorizontalAlignment', 'left',...
    'HandleVisibility','callback');

% Texto manter as ultimas simula��es
texto = uicontrol(hf,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.585 0.02 0.1 0.015],...
    'BackgroundColor',get(hf,'Color'),...
    'String','Manter na tela as �ltimas ' ,...
    'HorizontalAlignment', 'left',...
    'HandleVisibility','callback');
texto.FontSize = texto.FontSize*1.4;
texto.Position(3) = texto.Extent(3);
texto.Position(4) = texto.Extent(4);


% Caixinha com o numero de simula��es
caixa = uicontrol(hf,...
    'Style','edit',...
    'Units','normalized',...
    'Position',[0.585+texto.Extent(3) 0.027 0.015 0.03],...
    'BackgroundColor',get(hf,'Color'),...
    'String', '1',...
    'HorizontalAlignment', 'center',...
    'HandleVisibility','callback');

% Resto do texto
texto = uicontrol(hf,...
    'Style','text',...
    'Units','normalized',...
    'Position',[caixa.Position(1)+0.02 0.02 0.1 0.015],...
    'BackgroundColor',get(hf,'Color'),...
    'String','curvas. ' ,...
    'HorizontalAlignment', 'left',...
    'HandleVisibility','callback');
texto.FontSize = texto.FontSize*1.4;
texto.Position(3) = texto.Extent(3);
texto.Position(4) = texto.Extent(4);

% Bot�o Limpar tudo
uicontrol('Parent',hf,...
    'Style','pushbutton',...
    'Units','normalized',...
    'Position',[0.78 0.017 0.07 0.05],...
    'BackgroundColor',get(hf,'Color'),...
    'String','Limpar Tudo',...
    'Enable','on',...
    'HandleVisibility','callback',...
    'Callback',@cb_cleanAll,...
    'Tag','bt_cleanAll');
%% Finaliza a GUI
global ad; % Em geral a comunica��o entre as callbacks e componentes do programa seria feita criando a lista de handles dos componentes
           % e adicionando na guidata do hf (guidata(hf, ad)). Mas como �
           % um software um pouco complexo demais em termos de fazer as
           % 'liga��es', prefiro usar uma variavel global ad, acess�vel de
           % qualquer lugar sem passar trabalho.
           
% Cria lista de handles
ad.handles = guihandles(hf);

% Move para o centro e exibe a tela
movegui(hf, 'center');
set(hf, 'Visible', 'on');