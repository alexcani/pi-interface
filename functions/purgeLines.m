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

function purgeLines()
global ad;
N = numel(ad.linhas); % N�mero de linhas

% O objetivo � garantir que ad.lines nunca tenha elementos vazios.
% Como ad.lines come�a vazio e no primeiro start � criado com certeza um
% elemento n�o nulo e ad.lines passa a ter 1 elemento, basta para garantir
% que tudo funcione que no caso em que o novo Nmax seja MENOR que o numero
% atual de elementos, os elementos de ad.lines sejam deletados e removidos
% do struct corretamente, deixando o N = Nmax. Se o novo Nmax � maior que
% N, nada � necess�rio fazer.

if(ad.Nmax<N)
    for i = ad.Nmax+1:N % Deletar da tela e do struct os seguintes elementos
        aux = ad.linhas{i};
        for j=1:numel(aux)
            delete(aux(j)); % Remove da tela
        end
    end
    ad.linhas = ad.linhas(1:ad.Nmax); % Remove todos at� Nmax
end

