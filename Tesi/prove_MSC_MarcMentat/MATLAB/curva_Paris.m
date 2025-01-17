%% Curva di Paris %%

clc
clear all
close all

%%%%%%%%%%%%%%%%%     DATI    %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parametro C [-]
C = 6.72e-13;

% Parametro n [-]
m = 2.26;

% Vettore lunghezze di cricca
a = [1.5 2.7 4.1 8.0 10.0 11.0];

% Vettore SIF
SIF = [13 17 24 35 50 56];

% Vettore Delta K
Delta_K = [];
for i=1:length(SIF)-1
Delta_K(i) = SIF(i+1) - SIF(1);
end

% Vettore velocità di propagazione di cricca
da_dN = C*Delta_K.^m;

% Curva di fitting di Paris
x = logspace(-2,1.7);
y = (1.0e-12)*x.^6 + (-1.0e-11)*x.^5 + (1.0e-11)*x.^4 + (1.0e-8)*x.^3 + (-1.0e-8)*x.^2; 
y = y*(1.4e-5);


% Plot della curva di Paris
figure

loglog(Delta_K, da_dN,'square', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'k');
hold on;
loglog(x,y, 'b--', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Curva di Fitting')
title('Curva di Paris');
xlabel('log(\DeltaK)    [MPa \surd{m}]', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log(da/dN)      [m/ciclo]', 'FontSize', 12);
xlim([1, 100])
% ylim([10^-11, 10^-9])
%set(gca, 'XScale', 'log', 'YScale', 'log');
grid on;



