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

% % Vettore delta_K
% a_m = [];
% for i=1:length(a)-1
%     a_m(i) = (a(i+1)+a(i))/2;
% end
% delta_K = Y*delta_s*sqrt(pi*a_m);


% Delta K di soglia (K_th)
K_th = 1.77;

% Fracture thoughness
K_c = 61.1; % [MPa m^1/2]

% Vettore delta_K
a_m = [];
a_max = [];
for i=1:length(a)-1
    a_m(i) = (a(i+1)+a(1))/2;
    a_max(i) = a(i+1);
end
delta_K = Y*delta_s*sqrt(pi*a_m);
K_max = Y*delta_s*sqrt(pi*a_max);


% Vettore velocità di propagazione di cricca (Paris)
da_dN = C*delta_K.^m;

% Vettore velocità di propagazione di cricca (Forman)
R=0;
da_dN_F = (C*delta_K.^m)./((1-R)*K_c - delta_K);

% Vettore velocità di propagazione di cricca (Wertemann)
da_dN_W = (C*delta_K.^m)./(K_c^2 - K_max.^2);

% Vettore velocità di propagazione di cricca (Klesnil e Lucas)
da_dN_KL = C*(delta_K.^m - K_th.^m);

% Vettore velocità di propagazione di cricca (Donahue)
da_dN_D = C*(delta_K - K_th).^m;

% Vettore velocità di propagazione di cricca (Priddle)
da_dN_P = C*((delta_K - K_th)./(K_c - K_max)).^m;

% Vettore velocità di propagazione di cricca (McEvily)
da_dN_M = C * (delta_K - K_th).^2 * (1 + (delta_K)/(K_c - K_max));

delta_K = log10(delta_K);
da_dN = log10(da_dN); 
da_dN_D = log10(da_dN_D); 
da_dN_F = log10(da_dN_F); 
da_dN_W = log10(da_dN_W); 
da_dN_P = log10(da_dN_P); 
da_dN_M = log10(da_dN_M); 


% Plot della CURVA DI FITTING
% Parametri iniziali
x1 = delta_K(1); y1 = da_dN(1); % Punto 1
x2 = delta_K(end); y2 = da_dN(end); % Punto 2
% Calcolo della pendenza centrale
m = (y2 - y1) / (x2 - x1);
% Parametri della funzione cubica
h = (x1 + x2) / 2; % Punto centrale tra x1 e x2
a = 10; % Regola la curvatura e gli estremi
b = m; % Pendenza centrale
c = (y1 + y2) / 2; % Posizionamento verticale
% Generazione dei dati
x = linspace(1.2, 1.9, 1000); % Range di x
y = a * (x - h).^3 + b * (x - h) + c;


%% Plot della curve

figure

loglog(delta_K, da_dN,'ro', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'Paris');
hold on
% loglog(Delta_K, da_dN_KL,'bo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Klesnil e Lucas');
% hold on
loglog(delta_K, da_dN_D,'bo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Donahue');
hold on
loglog(delta_K, da_dN_F,'yo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'y', 'DisplayName', 'Forman');
hold on
loglog(delta_K, da_dN_W,'mo', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'm', 'DisplayName', 'Wertemann');
hold on
loglog(delta_K, da_dN_P,'go', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'g', 'DisplayName', 'Priddle');
hold on
loglog(delta_K, da_dN_M,'co', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'c', 'DisplayName', 'McEvily');
hold on
loglog(x,y*(0.9995), 'k-', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Curva di Paris')

hold on

% Curva del TRATTO LINEARE
x_lin = linspace(1.35, 1.75, 1000); % Range di x
y_lin = m.*(x_lin-h)  + c  ;
loglog(x_lin, y_lin, 'k-', 'LineWidth', 1, 'DisplayName', ' Tratto Lineare')

hold on

% INTERSEZIONE curva di fitting e curva lineare
% Trova i punti di intersezione
diff_y = y_lin - y;  % Differenza tra le due curve
intersection_indices = find(abs(diff_y) < 0.25); % Trova i punti dove la differenza è vicina a zero
% Estrai i valori di x delle intersezioni
x_intersections = x(intersection_indices); % Valori di x

% Plot delle INTERSEZIONI per la visualizzazione grafica del tratto lineare
% Intersezione sx
xline(x_intersections(1), 'b-.', 'LineWidth', 1.5, 'HandleVisibility', 'off');
% Asintoto di frattura delta_K_c
xline(x_intersections(end), 'b-.', 'LineWidth', 1.5, 'HandleVisibility', 'off');

hold on

% Plot degli ASINTOTI
% Asintoto di soglia delta_K_th
a_th = 1.3e-3; % [m]
delta_K_th = Y*delta_s*sqrt(pi*a_th);
xline(log10(delta_K_th), 'k--', 'LineWidth', 0.5, 'HandleVisibility', 'off');
% Asintoto di frattura delta_K_c
a_c = 12e-3; % [m]
delta_K_c = Y*delta_s*sqrt(pi*a_c);
xline(log10(delta_K_c), 'k--', 'LineWidth', 0.5, 'HandleVisibility', 'off');

% Set del grafico
title('Curve alternative a Paris');
xlabel('log(\DeltaK)    [MPa \surd{m}]', 'FontWeight', 'bold', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log(da/dN)      [m/ciclo]', 'FontWeight', 'bold', 'FontSize', 12);
grid on;
ylim([-13, -7.5])
xlim([1.25, 1.8])
legend('FontWeight', 'normal', 'FontSize', 10)
grid on;
% Miglioramento della leggibilità degli assi
ax = gca;
ax.FontSize = 12; % Dimensione del font
ax.FontWeight = 'bold'; % Grassetto per maggiore contrasto
ax.XColor = 'k'; % Colore asse X (nero)
ax.YColor = 'k'; % Colore asse Y (nero)

