% PLOT DELLE CURVE CHE ANALIZZANO IL DANNO 
% SECONDO IL MODELLO DI BONORA

clc
clear all
close all

%% Estrapolazione dei dati dai fogli EXCEL
B_15 = xlsread('Bonora_15_excel.xlsx', 'B10:C15');
B_110 = xlsread('Bonora_110_excel.xlsx', 'B10:C15');
D_c = 0.1356;

% Plot delle CURVE
figure % Assoluta
% Plot della curva relativa alla lunghezza di cricca di 1.5 mm
plot(B_15(:,1),B_15(:,2), 'Color','r', 'Marker', 's', 'LineStyle','-','LineWidth', 1.5, 'MarkerSize', 10, 'MarkerFaceColor', 'k', 'DisplayName', '1.5 mm');
hold on
% Plot della curva relativa alla lunghezza di cricca di 11.0 mm
plot(B_110(:,1),B_110(:,2), 'Color','b', 'Marker', 'o', 'LineStyle','-','LineWidth', 1.5, 'MarkerSize', 10, 'MarkerFaceColor', 'k', 'DisplayName', '11.0 mm');
hold on
% Plot del valore costante del parametro di danno crittico D_c = 0.1356
yline(D_c, 'k--', 'LineWidth', 1.5, 'DisplayName', 'Critic Damage');
% Set del grafico
title('Andamento del danno nel tempo di simulazione');
xlabel('Incrementi   [-]', 'FontWeight', 'bold', 'FontSize', 14, 'Interpreter', 'tex');  
ylabel('Damage      [-]', 'FontWeight', 'bold', 'FontSize', 14, 'Interpreter', 'tex');
grid on;
ylim([0, 0.2])
xlim([0, B_15(end,1)])
legend('Location','northeast')

figure % Relativa rispetto a D_c
% Plot della curva relativa alla lunghezza di cricca di 1.5 mm
plot(B_15(:,1),(B_15(:,2)/D_c)*100, 'Color','r', 'Marker', 's', 'LineStyle','-','LineWidth', 1.5, 'MarkerSize', 10, 'MarkerFaceColor', 'k', 'DisplayName', '1.5 mm');
hold on
% Plot della curva relativa alla lunghezza di cricca di 11.0 mm
plot(B_110(:,1),(B_110(:,2)/D_c)*100, 'Color','b', 'Marker', 'o', 'LineStyle','-','LineWidth', 1.5, 'MarkerSize', 10, 'MarkerFaceColor', 'k', 'DisplayName', '11.0 mm');
hold on
% Plot del valore costante del parametro di danno crittico D_c = 0.1356
yline((D_c/D_c)*100, 'k--', 'LineWidth', 1.5, 'DisplayName', 'Critic Damage');
% Set del grafico
title('Andamento del danno nel tempo di simulazione', 'FontSize', 14);
xlabel('Incrementi   [-]', 'FontWeight', 'bold', 'FontSize', 14, 'Interpreter', 'tex');  
ylabel('Damage / D_c     [%]', 'FontWeight', 'bold', 'FontSize', 14, 'Interpreter', 'tex');
grid on;
ylim([-1, 101])
xlim([0, B_15(end,1)])
legend('Location','northeast', 'FontSize', 14)
set(gca, 'GridLineStyle', '-', 'GridAlpha', 0.6); 

% Miglioramento della leggibilità degli assi
ax = gca;
ax.FontSize = 12; % Dimensione del font
ax.FontWeight = 'bold'; % Grassetto per maggiore contrasto
ax.XColor = 'k'; % Colore asse X (nero)
ax.YColor = 'k'; % Colore asse Y (nero)

