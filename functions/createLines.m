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

% IDEIA: CALLBACK DO CAMPO DE # DE CURVAS TRIGGA UMA FUN��O PURGE_LINHAS
% QUE GERENCIA AS COISAS
% IDEIA: TALVEZ FAZER OS ESTADOS DA SIMULA��O DE MANEIRA SEPARADA DO LINES

function linhas = createLines()
global ad;
% Fazer: excluir as linhas antigas
%       - precisa de uma estrutura em ad pra armazenar as linhas e
%       gerenciar
posCar = line('Parent', ad.handles.axes_posCar,...
    'XData',0,...
    'YData',0,...
    'Color','red',...
    'Tag','linhaTheta1');

velCar = line('Parent', ad.handles.axes_velCar,...
    'XData',0,...
    'YData',0,...
    'Color','red',...
    'Tag','linhaTheta1');

posPend = line('Parent', ad.handles.axes_posPend,...
    'XData',0,...
    'YData',0,...
    'Color','red',...
    'Tag','linhaTheta1');

velPend = line('Parent', ad.handles.axes_velPend,...
    'XData',0,...
    'YData',0,...
    'Color','red',...
    'Tag','linhaTheta1');

atuacao = line('Parent', ad.handles.axes_atuacao,...
    'XData',0,...
    'YData',0,...
    'Color','red',...
    'Tag','linhaTheta1');