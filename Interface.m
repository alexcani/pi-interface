% Este programa cria uma interface de usu�rio para interagir
% com o Kit Did�tico para Controle com modelo de Grua.
% 
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

function varargout = Interface()
% Valida n�mero de sa�das
nargoutchk(0,0);

% Adiciona as subpastas necess�rias ao PATH do Matlab
% Ser�o removidas ao fechar a janela
global p;
p = path(); % Armazena o path original
mfilepath=fileparts(which(mfilename)); % Caminho completo do arquivo
addpath(fullfile(mfilepath, 'callbacks'))
addpath(fullfile(mfilepath, 'functions'))

tag = 'interface_kit';

% Par�metros do Modelo
parametros_modelo;

% Cria a interface se ela n�o existe
% Exibe a interface se j� foi criada
% hf = handle figure
hf = findall(0,'Tag',tag); % Busca elemento pela tag
if isempty(hf)
    % Cria se n�o existe
    hf = buildInterface(tag);
else
    % Exibe se j� existe
    figure(hf);
end