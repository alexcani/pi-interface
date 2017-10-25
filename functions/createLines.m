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

function createLines()
global ad;
%Linha:
% 1 - posX
% 2 - velX
% 3 - posT
% 4 - velT
% 5 - atu

% Fazer: excluir as linhas antigas
%       - precisa de uma estrutura em ad pra armazenar as linhas e
%       gerenciar
% Etapas:
% - Verificar # de linhas permitidas Nmax
% - Numero atual de linhas N. Se N+1 <= Nmax criar e shiftar tudo pra baixo
% - Se N+1 > Nmax ent�o deletar ad.linhas{Nmax}, criar e shiftar


cores = get(ad.handles.axes_posCar, 'ColorOrder');
cor = cores(ad.nextColor,:);
ad.nextColor = mod(ad.nextColor, 7)+1;

x0 = [-10; 0; 0; 0];

posCar = line('Parent', ad.handles.axes_posCar,...
    'XData',0,...
    'YData',x0(1),...
    'Color', cor);

velCar = line('Parent', ad.handles.axes_velCar,...
    'XData',0,...
    'YData',x0(2),...
    'Color', cor);

posPend = line('Parent', ad.handles.axes_posPend,...
    'XData',0,...
    'YData',x0(3),...
    'Color', cor);

velPend = line('Parent', ad.handles.axes_velPend,...
    'XData',0,...
    'YData',x0(4),...
    'Color', cor);

atuacao = line('Parent', ad.handles.axes_atuacao,...
    'XData',0,...
    'YData',0,...
    'Color', cor);

linhas = [posCar velCar posPend velPend atuacao];

% Aspectos da quantidade limite de linhas:
Nmax = ad.Nmax;
N = numel(ad.linhas)+1;
if(N <= Nmax) % Se ainda cabe, apenas shifta todas as linhas
    ad.linhas = {[] ad.linhas{:}};
else % Se n�o cabe, deleta a linha da tela e depois sobrescreve
    aux = ad.linhas{Nmax};
    for i=1:numel(aux)
        delete(aux(i));
    end
    for i=N-2:-1:1
        ad.linhas{i+1} = ad.linhas{i};
    end
end

% Adiciona a linha na posi��o 1
ad.linhas{1} = linhas;
ad.linhas