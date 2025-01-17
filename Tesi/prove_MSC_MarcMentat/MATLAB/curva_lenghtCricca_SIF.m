%% Curva SIF-LunghezzaCricca %%

clc
clear all
close all


% Essendo Y soggetto a differenze non significative nei vari incrementi
% progressivi dell'ampiezza di cricca, ci si aspetta una curva 
% a pendenza cost

clc
clear all 
close all

% K_C = Y \sigma * \sqrt(\pi * a_f)
%
% \sigma = 
% a_f = 11 mm
% K_C = 61 MPa m^(1/2)
%
% Y = K_C / (\sigma * \sqrt(\pi * a_f) )



% Vettore lunghezze di cricca
a = [1.5 2.7 4.1 8.0 10.0 11.0];

% Vettore SIF
SIF = [13 17 24 35 50 56];

% plot
plot(a, SIF, 'o-b', 'LineWidth', 2);
title('Curva SIF - LunghezzaCricca', 'FontWeight', 'bold');
xlabel('Lunghezza cricca [mm]', 'FontWeight', 'bold',  'FontSize', 16);
ylabel('SIF [MPa \surd{m}]', 'FontWeight', 'bold', 'FontSize', 16, 'Interpreter', 'tex');
grid on;
set(gca, 'GridLineStyle', '-', 'GridAlpha', 0.6); 

% Miglioramento della leggibilità degli assi
ax = gca;
ax.FontSize = 12; % Dimensione del font
ax.FontWeight = 'bold'; % Grassetto per maggiore contrasto
ax.XColor = 'k'; % Colore asse X (nero)
ax.YColor = 'k'; % Colore asse Y (nero)