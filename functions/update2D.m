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
function update2D(x, theta)
global L ad;

% Linha do carro, são 5 pontos (2 no mesmo lugar)
linhaCarro = ad.modelo2D(2);
xdata = [x-5 x-5 x+5 x+5 x-5];
ydata = [5 0 0 5 5];
set(linhaCarro, 'XData', xdata, 'YData', ydata);

% Linha do pendulo, são 2 pontos grossos
linhaPendulo = ad.modelo2D(3);
xdata = [x x+sin(theta)*L];
ydata = [0 -L*cos(theta)];
set(linhaPendulo, 'XData', xdata, 'YData', ydata);

end