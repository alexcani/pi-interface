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

% Recebe os estados e a entrada
function xp = modelo(~, x2, x3, x4, u, pertCar, pertPend)
global M m L g;
x1p = x2;
x2p = (m*g*sin(x3)*cos(x3)+m*L*x4^2*sin(x3) + u)/(M+m*sin(x3)^2) + pertCar;
x3p = x4;
x4p = -((m+M)*g*sin(x3)+m*L*x4^2*sin(x3)*cos(x3)+u*cos(x3))/((M+m*sin(x3)^2)*L) + pertPend;
xp = [x1p; x2p; x3p; x4p];
return