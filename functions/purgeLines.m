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

function purgeLines()
global ad;
N = numel(ad.linhas); % Número de linhas

% O objetivo é garantir que ad.lines nunca tenha elementos vazios.
% Como ad.lines começa vazio e no primeiro start é criado com certeza um
% elemento não nulo e ad.lines passa a ter 1 elemento, basta para garantir
% que tudo funcione que no caso em que o novo Nmax seja MENOR que o numero
% atual de elementos, os elementos de ad.lines sejam deletados e removidos
% do struct corretamente, deixando o N = Nmax. Se o novo Nmax é maior que
% N, nada é necessário fazer.

if(ad.Nmax<N)
    for i = ad.Nmax+1:N % Deletar da tela e do struct os seguintes elementos
        aux = ad.linhas{i};
        for j=1:numel(aux)
            delete(aux(j)); % Remove da tela
        end
    end
    ad.linhas = ad.linhas(1:ad.Nmax); % Remove todos até Nmax
end

