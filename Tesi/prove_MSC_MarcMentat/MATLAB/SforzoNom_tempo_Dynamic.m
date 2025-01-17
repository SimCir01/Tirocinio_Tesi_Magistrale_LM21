% Curva relativa all'andamento dello SFORZO NOMINALE NEL TEMPO
% visualizzata in maniera dinamica


clc
clear all
close all


% Dati di INPUT
A = 300308e-3;              % Ampiezza
T = 1.5;                    % Periodo del coseno
f = 1 / T;                  % Frequenza
dt = 0.01;                  % Incremento temporale
x_totale = 0:dt:5;         % Tempo totale fino a 10 secondi
y_totale = zeros(size(x_totale)); % Preallocazione del vettore y

% Figura per animazione
figure;
hold on;
grid on;
xlabel('Tempo [s]', 'FontWeight', 'bold', 'FontSize', 14);
ylabel('Sforzo [MPa]', 'FontWeight', 'bold', 'FontSize', 14);
title('Andamento dello sforzo nominale \Delta\sigma nel tempo', 'FontSize', 14);
xlim([0,5]);
ylim([-A, 2*A])
hold on
yline(0, 'k--', 'LineWidth', 0.5);
plot_handle = plot(nan, nan, 'LineWidth', 2);

% Initialize video
myVideo = VideoWriter('DynStressTime'); %open video file
myVideo.FrameRate = 50;  %can adjust this, 5 - 10 works well for me
open(myVideo)


% Loop per costruire dinamicamente il segnale
for t = 1:length(x_totale)
    % Calcola il valore corrente di y
    x_corrente = x_totale(1:t); % Valori di x fino all'istante corrente
    y_corrente = (A/2) * cos(2*pi*f*x_corrente - 1) + (A/2);
    
    % Aggiorna il grafico
    set(plot_handle, 'XData', x_corrente, 'YData', y_corrente);
    drawnow; % Aggiorna il grafico
    pause(5e-10); % Pause per simulare l'evoluzione temporale

    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
end

close(myVideo)