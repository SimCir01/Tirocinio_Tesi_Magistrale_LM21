% Rappresentazione di curve alternative alla
% legge di Paris


clc
clear all
close all

%% Parametri e variabili di input

% Parametro C [-]
C = 6.0946e-13;

% Parametro n [-]
m = 2.2806;

% Vettore lunghezze di cricca
a = [1.5 2.7 4.1 8.0 10.0 11.0]*1e-3;

% Fattore di forma
Y = 1;

% Differenza di sforzo (nominale)
delta_s = 300308e-3; % [MPa]

% Delta K di soglia (K_th)
K_th = 1.15;

% Fracture thoughness
K_c = 61.1; % [MPa m^1/2]

% Vettore delta_K
a_m = [];
a_max = [];
for i=1:length(a)-1
    a_m(i) = (a(i+1)+a(1))/2;
    a_max(i) = a(i+1);
end
Delta_K = Y*delta_s*sqrt(pi*a_m);
K_max = Y*delta_s*sqrt(pi*a_max);

% Vettore velocità di propagazione di cricca (Paris)
da_dN = C*Delta_K.^m;

% Vettore velocità di propagazione di cricca (Forman)
R=0;
da_dN_F = (C*Delta_K.^m)./((1-R)*K_c - Delta_K);

% Vettore velocità di propagazione di cricca (Wertemann)
da_dN_W = (C*Delta_K.^m)./(K_c^2 - K_max.^2);

% Vettore velocità di propagazione di cricca (Klesnil e Lucas)
da_dN_KL = C*(Delta_K.^m - K_th.^m);

% Vettore velocità di propagazione di cricca (Donahue)
da_dN_D = C*(Delta_K - K_th).^m;

% Vettore velocità di propagazione di cricca (Priddle)
da_dN_P = C*((Delta_K - K_th)./(K_c - K_max)).^m;

% Vettore velocità di propagazione di cricca (McEvily)
da_dN_M = C * (Delta_K - K_th).^2 * (1 + (Delta_K)/(K_c - K_max));

% Curva di fitting (Paris)
x = linspace(1,60,10e3);
y = 1 ./ (log(60 - x)) - 1 ./ (log(x - (-20)));
y(y <= 0) = NaN;

%% Plot della curve
figure

loglog(Delta_K, da_dN,'ro', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'Paris');
hold on
% loglog(Delta_K, da_dN_KL,'bo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Klesnil e Lucas');
% hold on
loglog(Delta_K, da_dN_D,'bo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Donahue');
hold on
loglog(Delta_K, da_dN_F,'yo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'y', 'DisplayName', 'Forman');
hold on
loglog(Delta_K, da_dN_W,'mo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'm', 'DisplayName', 'Wertemann');
hold on
loglog(Delta_K, da_dN_P,'go', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'g', 'DisplayName', 'Priddle');
hold on
loglog(Delta_K, da_dN_M,'co', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'c', 'DisplayName', 'McEvily');
hold on
loglog(x,y*(0.3e-7), 'k--', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Curva di Fitting')

hold on

% Plot degli asintoti
% Asintoto di soglia delta_K_th
a_th = 1.5e-3; % [m]
delta_K_th = Y*delta_s*sqrt(pi*a_th);
xline(delta_K_th, 'k-', 'LineWidth', 0.5);
% Asintoto di frattura delta_K_c
a_c = 12e-3; % [m]
delta_K_c = Y*delta_s*sqrt(pi*a_c);
xline(delta_K_c, 'k-', 'LineWidth', 0.5);

title('Curve alternative a Paris');
xlabel('log(\DeltaK)    [MPa \surd{m}]', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log(da/dN)      [m/ciclo]', 'FontSize', 12);
xlim([10, 100])
grid on;
% ylim([10^-11, 10^-9])
%set(gca, 'XScale', 'log');
legend
grid on;

