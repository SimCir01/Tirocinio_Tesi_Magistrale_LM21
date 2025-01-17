%% Curva di Paris %%

clc
clear all
close all

%%%%%%%%%%%%%%%%%     DATI    %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parametro C [-]
C = 6.72e-13;

% Parametro n [-]
n = 2.20;

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
da_dN = C*Delta_K.^n;

% Plot della curva di Paris
figure

plot(Delta_K, da_dN,'b-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'k');
title('Curva SIF-LunghezzaCricca');
xlabel('log \DeltaK [MPa \surd{m}]', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log da/dN [m/ciclo]', 'FontSize', 12);
set(gca, 'XScale', 'log', 'YScale', 'log');
grid on;



% Logaritmizzazione dei dati per il fitting
log_Delta_K = log10(Delta_K);
log_da_dN = log10(da_dN);

% Fitting dei dati logaritmici
p = polyfit(log_Delta_K, log_da_dN, 1); % Fit lineare (1° grado)
m = p(1); % Esponente
C = 10^p(2); % Costante C

% Genera i dati adattati per la curva di fitting
fitted_da_dN = C * Delta_K.^m;

% Aggiungi la curva di fitting al grafico
hold on;
plot(Delta_K, fitted_da_dN, 'r--', 'LineWidth', 2); % Curva di fitting
legend('Dati', 'Fitting della Curva di Paris', 'Location', 'NorthWest');

% Visualizza i parametri C e m
text(0.1, 0.5, sprintf('C = %.2e\nm = %.2f', C, m), 'Units', 'normalized', 'FontSize', 10);

% primo tratto esponenziale 
A = 0.3e-10; d = 10e-10; 
K_esp1 = 1:0.1:7;
a_esp1 = A * log(K_esp1 + d);
plot(K_esp1, a_esp1, 'k-', 'LineWidth', 2);
%set(gca, 'XScale', 'log', 'YScale', 'log');
hold on

% secondo tratto esponenziale
B2 = 0.5e-10; k = 0.1;
K_esp2 = 18:0.1:100;
a_esp2 = B2 * exp(k * (K_esp2 - 0.7));
plot(K_esp2, a_esp2, 'k-', 'LineWidth', 2);
%set(gca, 'XScale', 'log', 'YScale', 'log');
hold off
