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

function cb_closeMainWindow(hObject,~)
% Recupera o path original
global p ad;
path(p);

ad.simulando = 0;
ad.pausado = 0;

% Fecha o programa e deleta a janela
clear ad
clear p
delete(hObject);