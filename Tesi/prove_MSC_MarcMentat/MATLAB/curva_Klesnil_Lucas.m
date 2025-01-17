%% Curva di Klesnil e Lucas %%


clc
clear all
close all

%%%%%%%%%%%%%%%%%     DATI    %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parametro C [-]
C = 1.41e-8;

% Parametro n [-]
n = 3.32;

% Delta K di soglia (K_th)
K_th = 1.13;

% Vettore lunghezze di cricca
a = [2.7 8.0 10.0 12.0];

% Vettore SIF
SIF = [17 35 50 57];

% Vettore Delta K
Delta_K = [];
for i=1:length(SIF)-1
Delta_K(i) = SIF(i+1) - SIF(i);
end

% Vettore velocità di propagazione di cricca
da_dN = C*(Delta_K.^n - K_th.^n);

% Plot della curva di Paris
figure

loglog(Delta_K, da_dN,'b-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'k');
title('Curva di Klesnil e Lucas');
xlabel('log(\DeltaK)    [MPa \surd{m}]', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log(da/dN)      [m/ciclo]', 'FontSize', 12);
xlim([1, 100])
% ylim([10^-11, 10^-9])
%set(gca, 'XScale', 'log', 'YScale', 'log');
grid on;
