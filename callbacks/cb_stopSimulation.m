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

function cb_stopSimulation(hObject,eventdata)
global ad;

% A��es sobre outros elementos da interface
% Desabilita bot�o de Parar
hObject.Enable = 'off';

% Modifica texto do bot�o de iniciar para Iniciar
ad.handles.bt_iniciaPausaSim.String = 'Inicia';

ad.simulando = 0;

return