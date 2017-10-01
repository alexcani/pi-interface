% Este programa cria uma interface de usuário para interagir
% com o Kit Didático para Controle com modelo de Grua.
% 
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

function varargout = Interface()
% Valida número de saídas
nargoutchk(0,0);

% Adiciona as subpastas necessárias ao PATH do Matlab
% Serão removidas ao fechar a janela
global p;
p = path(); % Armazena o path original
mfilepath=fileparts(which(mfilename)); % Caminho completo do arquivo
addpath(fullfile(mfilepath, 'callbacks'))
addpath(fullfile(mfilepath, 'functions'))

tag = 'interface_kit';

% Parâmetros do Modelo
parametros_modelo;

% Cria a interface se ela não existe
% Exibe a interface se já foi criada
% hf = handle figure
hf = findall(0,'Tag',tag); % Busca elemento pela tag
if isempty(hf)
    % Cria se não existe
    hf = buildInterface(tag);
else
    % Exibe se já existe
    figure(hf);
end