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

function cb_changeCOMPort(hObject,~)
global ad;

conversion = str2num(hObject.String);
if isempty(conversion)
    hObject.String = num2str(ad.COMPort);
else
    if(mod(conversion, 1) == 0 && conversion >=0)
        ad.COMPort = conversion;
    else
        hObject.String = num2str(ad.COMPort);
    end
end

end