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

function cb_cleanAll(hObject,eventdata)
global ad;
for i = 1:numel(ad.linhas)
    aux = ad.linhas{i};
    for j=1:numel(aux)
        delete(aux(j));
    end
end
ad.linhas = {};

set(ad.handles.linha2DCarro, 'XData', 0, 'YData', 0);
set(ad.handles.linha2DPendulo, 'XData', 0, 'YData', 0);
return