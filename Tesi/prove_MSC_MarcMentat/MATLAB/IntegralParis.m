%% Integrazione della legge di Paris %%

clear all
close all
clc

%%%%%%%%%%%%%%%%%     DATI    %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lunghezza iniziale della cricca [m]
a_0 = 0e-3;

% Lunghezza finale della cricca [m]
a_f = 4.1e-3;

% Sforzo minimo [kPa] -----*-3-----> [MPa]
s_min = 0;   % [MPa] 

% Sforzo massimo (nominale) [kPa] -----*-3-----> [MPa]
s_max = 300308e-3;   % [MPa]

% Delta sigma [Pa]
delta_s = s_max - s_min;

% Fattore di forma [-]
Y = 1;

% Parametro C [-]
C = 6.72e-13;

% Parametro n [-]
m = 2.26;
m_= (m/2)-1;

%%%%%%%%%%%%%%%%     CALCOLO   %%%%%%%%%%%%%%%%%%%%%%%%%%%

if m~=2
    % Numero di cicli a fatica con n~=2
    % N_cicli = (a_f^(1/(n/2-1))-a_0^(1/(n/2-1)))/((n/2-1)*C*(Y^n)*(delta_s^n)*(pi^(n/2)));
    % N_cicli=(((1/(a_0^n2))-(1/(a_f^n2))))/(n2*C*(delta_s^n)); % Di Bona
    N_cicli = (a_0^(-m_)-a_f^(-m_))/(C*m_*(Y*delta_s*sqrt(pi))^m);
else
    % Numero di cicli a fatica con n==2
    N_cicli = log(a_f/a_0)/(C*pi*(Y*delta_s)^2);
end




