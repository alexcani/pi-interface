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

function cb_change_max_curves(hObject,~)
global ad;

conversion = str2num(hObject.String);
if isempty(conversion) || conversion == Inf || conversion == -Inf || floor(conversion) ~= conversion || conversion > 7 || conversion <= 0% Deve ser numero inteiro diferente de infinito, entre 0 e 7
    hObject.String = num2str(ad.Nmax);
else
    ad.Nmax = conversion;
    purgeLines(); % Limpa linhas caso necessário
end

end