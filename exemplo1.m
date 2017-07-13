clc, clear all, close all
warning off

%% Simula��o n�o linear do sat�lite
x0=[1; 0; 0; 1];
tempo=0:0.01:10;

% chamada da fun��o ode45
[t x]=ode45('nonlinear_satelite',tempo,x0);

%% gr[aficos
figure(1)
plot(t,x(:,1),'b','LineWidth',2), hold
plot(t,x(:,2),'r','LineWidth',2)
xlabel('Time (s)', 'FontSize',14)
ylabel('r, r_{dot}', 'FontSize',14)
legend('r','r_{dot}',2)
grid

figure(2)
plot(t,x(:,3),'b','LineWidth',2), hold
plot(t,x(:,4),'r','LineWidth',2)
xlabel('Time (s)', 'FontSize',14)
ylabel('\alpha, \alpha_{dot}', 'FontSize',14)
legend('\alpha','\alpha_{dot}',2)
grid