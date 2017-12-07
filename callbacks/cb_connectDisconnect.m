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

function cb_connectDisconnect(hObject,~)
    global ad;
    
    if(strcmp(hObject.String,'Desconectar') == 1)
        hObject.String = 'Conectar';
        set(ad.handles.bt_ligaMotor, 'Enable', 'off');
        fclose(ad.serialObject);
    else
        try
            ad.serialObject = serial(strcat('COM', num2str(ad.COMPort)), 'BaudRate', 57600);
            fopen(ad.serialObject);
            hObject.String = 'Desconectar';
            set(ad.handles.bt_ligaMotor, 'Enable', 'on');
        catch
            disp('Não foi possível conectar');
        end
    end