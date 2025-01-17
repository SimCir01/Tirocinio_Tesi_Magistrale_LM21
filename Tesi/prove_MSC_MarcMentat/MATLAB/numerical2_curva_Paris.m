% Si vuole seguire la procedura per graficare da/dn 
% in funzione di delta K seguendo la procedura 
% numerica di Vergani p.165 ('Meccanica dei materiali')

clc
clear all
close all

%% Parametri e variabili di input

% Vettore lunghezze di cricca
a = [1.5 2.7 4.1 8.0 10.0 11.0]*1e-3;  % [m]

% Vettore numero di cicli
N = [0 1.35 2.25 3.60 4.02 4.20]*1e06;  % [cicli]

% Fattore di forma
Y = 1;

% Range di sforzo (nominale)
delta_s = 300308e-3;    % [MPa]

% Vettore da/dN
delta_a = [];
delta_N = [];
for i=1:length(a)-1
    delta_a(i) = a(i+1)-a(i);
end
for i=1:length(N)-1
    delta_N(i) = N(i+1)-N(i);
end
da_dN = delta_a./delta_N;

% Vettore delta_K
a_m = [];
for i=1:length(a)-1
    a_m(i) = (a(i+1)+a(i))/2;
end
delta_K = Y*delta_s*sqrt(pi*a_m);

% delta_K = delta_K';
% da_dN = da_dN';

%% Interpolazione lineare
% Retta y = mx + b per interpolazione lineare dei punti
% e per ricavare i parametri C ed m

% C = log(b)
% m = m

p = polyfit(log10(delta_K), log10(da_dN), 1);
m = p(1);
C = 10^p(2);

%% Legge di Paris
% Una volta ricavati C ed m, graficando seguendo la formula
% i punti ottenuti, essi si sovrappongono 
% a quelli della procedura numerica


dA_dN = C*delta_K.^m;
dA_dN = log10(dA_dN);


%% Plot

delta_K = log10(delta_K);
da_dN = log10(da_dN);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure 
% Confronto Punti sperimentali secondo procedura numerica
% e Punti ottenuti seguendo la formula

% Plot dei punti ottenuti seguendo la formula di Paris
loglog(delta_K, dA_dN, 'Color','r', 'Marker', 'x', 'LineStyle','-','LineWidth', 1.5, 'MarkerSize', 10, 'MarkerFaceColor', 'k', 'DisplayName', 'Punti secondo la formula di Paris');

hold on 

% Plot dei PUNTI SPERIMENTALI ottenuti seguendo la procedura numerica
loglog(delta_K, da_dN, 'Color','k', 'Marker', 's', 'LineStyle','--','LineWidth', 1.5, 'MarkerSize', 3, 'MarkerFaceColor', 'k', 'DisplayName', 'Punti sperimentali');

% Set del grafico
title('Confronto analitico-sperimentale');
xlabel('log(\DeltaK)    [MPa \surd{m}]', 'FontWeight', 'bold', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log(da/dN)      [m/ciclo]', 'FontWeight', 'bold', 'FontSize', 12);
ylim([-9.10, -8.20])
xlim([1.3, 1.8])
grid on;
legend('Location', 'northwest');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
% Curva di Paris

% Plot dei PUNTI SPERIMENTALI ottenuti seguendo la procedura numerica
loglog(delta_K, da_dN, 'Color','k', 'Marker', 's', 'LineStyle','none','LineWidth', 1.5, 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Punti sperimentali');

hold on

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
loglog(x,y*(0.9995), 'k-', 'LineWidth', 2, 'DisplayName', 'Curva di Fitting')

hold on

% Curva del TRATTO LINEARE
x_lin = linspace(1.35, 1.75, 1000); % Range di x
y_lin = m.*(x_lin-h)  + c  ;
loglog(x_lin, y_lin, 'k-', 'LineWidth', 1, 'DisplayName', ' Tratto Lineare')

hold on

% INTERSEZIONE curva di fitting e curva lineare
% Trova i punti di intersezione
diff_y = y_lin - y;  % Differenza tra le due curve
intersection_indices = find(abs(diff_y) < 0.23); % Trova i punti dove la differenza è vicina a zero
% Estrai i valori di x delle intersezioni
x_intersections = x(intersection_indices); % Valori di x

% Plot delle INTERSEZIONI per la visualizzazione grafica del tratto lineare
% Intersezione sx
xline(x_intersections(1), 'b-.', 'LineWidth', 1.5, 'HandleVisibility', 'off');
% Asintoto di frattura delta_K_c
xline(x_intersections(end), 'b-.', 'LineWidth', 1.5, 'HandleVisibility', 'off');



% Plot degli ASINTOTI
% Asintoto di soglia delta_K_th
a_th = 1.3e-3; % [m]
delta_K_th = Y*delta_s*sqrt(pi*a_th);
xline(log10(delta_K_th), 'k--.', 'LineWidth', 1.5, 'HandleVisibility', 'off');
% Asintoto di frattura delta_K_c
a_c = 12.0e-3; % [m]
delta_K_c = Y*delta_s*sqrt(pi*a_c);
xline(log10(delta_K_c), 'k--.', 'LineWidth', 1.5, 'HandleVisibility', 'off');


% Set del grafico
title('Curva di Paris');
xlabel('log(\DeltaK)    [MPa \surd{m}]', 'FontWeight', 'bold', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log(da/dN)      [m/ciclo]', 'FontWeight', 'bold', 'FontSize', 12);
ylim([-9.55, -7.95])
xlim([1.2, 2.0])
grid on;
legend;
%set(gca, 'GridLineStyle', '-', 'GridAlpha', 0.6); 

% Miglioramento della leggibilità degli assi
ax = gca;
ax.FontSize = 12; % Dimensione del font
ax.FontWeight = 'bold'; % Grassetto per maggiore contrasto
ax.XColor = 'k'; % Colore asse X (nero)
ax.YColor = 'k'; % Colore asse Y (nero)


