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

function cb_ligaMotor(hObject,~)
    global ad;
    
    if(strcmp(hObject.String,'Ligar Motor') == 1)
        hObject.String = 'Desligar Motor';
        fwrite(ad.serialObject, uint8(254));
    else
        hObject.String = 'Ligar Motor';
        fwrite(ad.serialObject, uint8(255));
    end