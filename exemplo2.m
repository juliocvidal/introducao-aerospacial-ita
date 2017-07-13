clc, clear all, close all
warning

%% Simulação não linear do satélite
x0=[0; 0; 0; 0.1; 0.1; 0.1];
tempo=0:0.01:10;

% chamada da função ode
[t x]=ode23('satelite_3eixos', tempo, x0);

%% gráficos
figure(1)
plot(t,x(:,1),'b','LineWidth',2), hold
plot(t,x(:,2),'r','LineWidth',2)
plot(t,x(:,3),'g','LineWidth',2)
xlabel('Time (s)', 'FontSize',14)
ylabel('p, q, r (rad/s)', 'FontSize',14)
legend('p','q','r',3)
grid

figure(2)
plot(t,x(:,4),'b','LineWidth',2), hold
plot(t,x(:,5),'r','LineWidth',2)
plot(t,x(:,6),'g','LineWidth',2)
xlabel('Time (s)', 'FontSize',14)
ylabel('\phi, \theta, \psi (rad)', 'FontSize',14)
legend('\phi', '\theta', '\psi',2)
grid