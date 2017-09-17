function cb_closeMainWindow(hObject,~)
% Recupera o path original
global p;
path(p);

% Fecha o programa e deleta a janela
delete(hObject);