clear all
close all
clc


% Genera dati di esempio basati sulla curva di Paris
K = linspace(0, 1, 100); % Intervallo ΔK
A = 1; C = 0.01; B1 = 2; B2 = 2; k = 5;

% Calcola la curva simile alla curva di Paris
a = zeros(size(K)); % Inizializza l'array per la crescita della cricca

for i = 1:length(K)
    if K(i) < 0.3
        a(i) = A * log(K(i) + C); % Crescita logaritmica
    elseif K(i) < 0.7
        a(i) = B1 * (K(i) - 0.3) + A * log(0.3 + C); % Crescita lineare
    else
        a(i) = B2 * exp(k * (K(i) - 0.7)); % Crescita esponenziale
    end
end

% Fit polinomiale di terzo grado
p = polyfit(K, a, 3); % Polinomio di terzo grado

% Calcola il valore della funzione polinomiale
fitted_curve = polyval(p, K);

% Grafico dei risultati
figure;
plot(K, fitted_curve, 'r-', 'LineWidth', 2, 'DisplayName', 'Forma teorica della curva di Paris');
xlabel('ΔK', 'FontWeight', 'bold');
ylabel('Crescita della cricca (Δa)', 'FontWeight', 'bold');
title('Curva di Paris - Fit Polinomiale', 'FontWeight', 'bold');
legend('Location', 'NorthWest');
%set(gca, 'XScale', 'log', 'YScale', 'log');
grid on;
hold on
K_lin = 0.3:0.1:0.5;
a_lin = B1 * (K_lin - 0.3) + A * log(0.3 + C);
plot(K_lin, a_lin, 'k-', 'LineWidth', 2, 'DisplayName', 'Tratto Lineare');
