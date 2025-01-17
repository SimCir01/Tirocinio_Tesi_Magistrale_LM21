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
% Graficando seguendo la formula, una volta ricavati C ed m,
% i punti ottenuti si sovrappongono a quelli della procedura numerica


%dA_dN = C*delta_K([1,4]).^m;


%% Plot
figure
% Plot dei punti ottenuti seguendo la procedura numerica
loglog(delta_K, da_dN, 'Color','k', 'Marker', 's', 'LineStyle','none','LineWidth', 1.5, 'MarkerSize', 8, 'MarkerFaceColor', 'k');

hold on

% % Plot dei punti ottenuti seguendo la formula di Paris
% loglog(delta_K([1,4]), dA_dN, 'Color','g','LineStyle','--', 'LineWidth', 1.5, 'MarkerSize', 6);

% hold on

% Plot della curva di fitting che rispecchia Paris nella sua completezza
x = linspace(1,60,10e3);
y = 1 ./ (log(60 - x)) - 1 ./ (log(x - (-20)));
y(y <= 0) = NaN;
loglog(x,y*(0.3e-7), 'k-', 'LineWidth', 1.5, 'DisplayName', 'Curva di Fitting')

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

title('Curva di Paris');
xlabel('log(\DeltaK)    [MPa \surd{m}]', 'FontSize', 12, 'Interpreter', 'tex');  
ylabel('log(da/dN)      [m/ciclo]', 'FontSize', 12);
xlim([10, 100])
grid on;

