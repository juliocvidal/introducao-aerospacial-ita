clc, clear all, close all
%% Linearização do sistema - obtenção matriz A, B, C, D
syms x1 x2 x3 x4 u1 u2

% x1 = r
% x2 = rdot
% x3 = alpha
% x4 = alphadot
% u1 = Fr
% u2 = Ft

% Parâmetros
syms m k 

f1 = x2;
f2 = x1*x4^2-(k/x1^2)+(u1/m);
f3 = x4;
f4 = -(2*x2*x4)/x1+u2/(m*x1^2);

A=[ diff(f1,x1) diff(f1,x2) diff(f1,x3) diff(f1,x4);
    diff(f2,x1) diff(f2,x2) diff(f2,x3) diff(f2,x4);
    diff(f3,x1) diff(f3,x2) diff(f3,x3) diff(f3,x4);
    diff(f4,x1) diff(f4,x2) diff(f4,x3) diff(f4,x4)];

B=[ diff(f1,u1) diff(f1,u2);
    diff(f2,u1) diff(f2,u2);
    diff(f3,u1) diff(f3,u2);
    diff(f4,u1) diff(f4,u2)];

% Atribuir aqui x=xe ou x=xop
% xe=ponto de equilíbrio
% xop=ponto de operação

C=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];

D=[0 0;
   0 0];
syms d w t 
x1=d;x2=0;x3=w*t;x4=w;
u1=0; u2=0;
m=1;

A=eval(A)
B=eval(B)
%%
A_sys=A;
B_sys=B;

d=1;
w=1;
k=w*d^3;

A=eval(A_sys)
B=eval(B_sys)

%%
Aa=[ A                  zeros(4,2);
    [-C(1,:); -C(3,:)]  zeros(2,2)]

Ba=[B;
    zeros(2,2)]

Q=2*[1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 1 0 0 0;
     0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1]
 
 R=[ 0.1  0;
      0   0.1]

 [K,S,E]=lqr(Aa,Ba,Q,R)