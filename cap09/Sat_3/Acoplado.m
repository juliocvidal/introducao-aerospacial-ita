close all;

A = [0 0 0.25 0.75 0 0;...
        0 0 0 0 2.52632 0;...
        0.75 0 0 0 0 0;...
        1 0 0 0 0 1;...
    0 1 0 0 0 0;...
    0 0 1 -1 0 0];

B = [-0.25 0 0;...
    0 -0.842105 0;...
    0 0 0.75;...
    0 0 0;...
    0 0 0;...
    0 0 0];

C = eye(6,6);

D = zeros(6,3);

Aaum = [A zeros(6,3);-C(4:6,:) zeros(3,3)];

Baum = [B; zeros(3,3)];

q = eye(9,9);

r = 0.01*eye(3,3);

[K,S,E] = lqr(Aaum,Baum,q,r);

ic = [0 0 0 0 0 0];
o = 1; 
p = 1;
tfin = 30;
epsilon1 = [0.8 0.8 0.8];
sim('satelite01',[0 30]);
PlotToBook(ScopeData01,ScopeData02,ScopeData03,ScopeData04,ScopeData05,ScopeData06,ScopeData07,ScopeData08)
print( 5, '-dpng', 'c8_sat3_01.png')
print(10, '-dpng', 'c8_sat3_02.png')
print(15, '-dpng', 'c8_sat3_03.png')
print(20, '-dpng', 'c8_sat3_04.png')
print(25, '-dpng', 'c8_sat3_05.png')
print(30, '-dpng', 'c8_sat3_06.png')
print(35, '-dpng', 'c8_sat3_07.png')
print(40, '-dpng', 'c8_sat3_08.png')
print(45, '-dpng', 'c8_sat3_09.png')
print(50, '-dpng', 'c8_sat3_10.png')

