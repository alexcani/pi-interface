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

function cb_stopSimulation(~,~)
global ad;

% Ações sobre outros elementos da interface
% Desabilita botão de Parar
set(ad.handles.bt_paraSim, 'Enable', 'off');

% Modifica texto do botão de iniciar para Iniciar
ad.handles.bt_iniciaPausaSim.String = 'Inicia';

% Libera botões exportar e limpar tudo
set(ad.handles.bt_cleanAll, 'Enable', 'on');
set(ad.handles.bt_exportaSelecao, 'Enable', 'on');

% Trava botões de perturbação
set(ad.handles.bt_perturbaCarro, 'Enable', 'off');
set(ad.handles.bt_perturbaPend, 'Enable', 'off');
ad.simulando = 0;
ad.pausado = 0;

return