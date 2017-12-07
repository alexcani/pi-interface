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

function cb_exportSelection(hObject,eventdata)
global ad;

% Verifica cada checkbox e vai montando o vetor de exportação a cada passo.
% São n vetores de exportação distintos com o nome <nome>_i, onde <nome> é o nome dado pelo usuário no campo da interface e
% i é a i-esima curva (i=1 é a mais recente).
% Cada vetor tem o formato:
% v = [t x vel_x theta vel_theta u]
% Onde t é o vetor de tempo, x, vel_x, theta, vel_theta e u são vetores coluna com os dados, caso selecionados.

for i = 1:numel(ad.linhas) % Para cada conjunto de curvas
    v = [];
    aux = ad.linhas{i};
    
    v = [v get(aux(1), 'XData')']; % Tempo
    
    if get(ad.handles.check_posCar, 'Value') == 1 % Exportar posição carrinho
        v = [v get(aux(1), 'YData')'];
    end
    if get(ad.handles.check_velCar, 'Value') == 1 % Exportar velocidade carrinho
        v = [v get(aux(2), 'YData')'];
    end
    if get(ad.handles.check_posPend, 'Value') == 1 % Exportar posição pêndulo
        v = [v get(aux(3), 'YData')'];
    end
    if get(ad.handles.check_velPend, 'Value') == 1 % Exportar velocidade pêndulo
        v = [v get(aux(4), 'YData')'];
    end
    if get(ad.handles.check_Atuacao, 'Value') == 1 % Exportar atuação
        v = [v get(aux(5), 'YData')'];
    end
    
    % Exporta para o workspace do matlab com o nome que está na caixinha
    nomeVar = strcat(ad.handles.box_export_name.String, '_', num2str(i));
    assignin('base', nomeVar, v);
end