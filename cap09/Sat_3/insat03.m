ic = [0 0 0 0 0 0]; tfin = 30; o =0.5;

A = [0 0 0.25 0.75 0 0;...
        0 0 0 0 2.52632 0;...
        0.75 0 0 0 0 0;...
        1 0 0 0 0 1;...
    0 1 0 0 0 0;...
    0 0 1 -1 0 0];

B = [-0.25 0 0;0 -0.842105 0;0 0 0.75;
    0 0 0;0 0 0;0 0 0];

C = eye(6,6); D = zeros(6,3);

Aaum = [A zeros(6,3);-C(4:6,:) zeros(3,3)];
Baum = [B; zeros(3,3)];

q = eye(9,9); r = 0.01*eye(3,3);

[K,S,E] = lqr(Aaum,Baum,q,r);

print( 5,'-dpng', '-r300','c9_sat3_01.png');
print(10,'-dpng', '-r300','c9_sat3_02.png');
print(15,'-dpng', '-r300','c9_sat3_03.png');
print(20,'-dpng', '-r300','c9_sat3_04.png');
print(25,'-dpng', '-r300','c9_sat3_05.png');
print(30,'-dpng', '-r300','c9_sat3_06.png');
print(35,'-dpng', '-r300','c9_sat3_07.png');
print(40,'-dpng', '-r300','c9_sat3_08.png');
print(45,'-dpng', '-r300','c9_sat3_09.png');
print(50,'-dpng', '-r300','c9_sat3_10.png');
