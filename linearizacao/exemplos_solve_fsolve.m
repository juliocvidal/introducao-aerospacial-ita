clc, clear all, close all
%% Exemplo de como usar o <solve>
clc, clear all, close all

syms x
ans=solve('x^2 - 5*x + 6 = 0', x);
double(ans)

syms x
ans=solve([x^2 - 5*x + 6 == 2], x);
double(ans)

%% Calculo de ponto de equlibrio xdot=0
%  usando o <solve>

clc, clear all, close all

syms x1 x2
[x1, x2] =solve([x2==0,-x1+0.25*x1^2==0], [x1,x2])

%% Calculo de ponto de equlibrio  xdot=0
%  usando o <fsolve>
%exemplo
clc, clear all, close all

T0=[0;0]
f = @(T)[2-0.2*(T(1)-8)-0.5*(T(1)-T(2));
         -0.1*(T(2)-8)-0.5*(T(2)-T(1))];
options = optimoptions('fsolve','Display','iter','ScaleProblem', 'Jacobian', 'MaxFunEvals', 10000, 'TolFun', 1e-20, 'TolX', 1e-20);
solve_results = fsolve(f, T0, options)





