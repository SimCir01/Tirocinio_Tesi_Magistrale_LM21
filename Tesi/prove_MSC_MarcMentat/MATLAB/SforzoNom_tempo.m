% Curva relativa all'andamento dello SFORZO NOMINALE NEL TEMPO

clc
close all
clear all

% Dati di INPUT
A = 300308e-3; %[MPa]
x = linspace(0, 1.5, 100);
y = (A/2)*cos(2*pi*0.5*x - 1)+ (A/2);

% PLOT della curva
figure
plot(x, y, 'LineWidth', 2);
xlabel('Tempo [s]', 'FontWeight', 'bold', 'FontSize', 14);
ylabel('Sforzo [MPa]', 'FontWeight', 'bold', 'FontSize', 14);
title('Andamento dello sforzo nominale \Delta\sigma nel tempo', 'FontSize', 14)
grid on

% % Salvataggio dei dati su EXCEL
% data = [x', y'];
% writematrix(data, 'SforzoNom_tempo.xlsx');