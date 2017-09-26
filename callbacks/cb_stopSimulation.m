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

function cb_stopSimulation(hObject,eventdata)
global ad;

% Ações sobre outros elementos da interface
% Desabilita botão de Parar
hObject.Enable = 'off';

% Modifica texto do botão de iniciar para Iniciar
ad.handles.bt_iniciaPausaSim.String = 'Inicia';

ad.simulando = 0;

return