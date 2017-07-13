d = 1; omega = 1; cin = [.8 0 0 1];

A = [0 1 0 0;3*omega^2 0 0 2*d*omega;
    0 0 0 1;0 -(2*omega)/d 0 0];

B = [0 0;1 0;0 0;0 1/d^2];

C = eye(4,4);
D = zeros(4,2);
H = [1 0 0 0;0 0 1 0];
%H = [1 0 0 0;0 0 0 1];

Aaum = [A zeros(4,2);-C(1,:) zeros(1,2);
    -C(3,:) zeros(1,2)];

Baum = [B; zeros(2,2)];

q =2*[1 0 0 0 0 0;0 1 0 0 0 0;0 0 1 0 0 0;
      0 0 0 1 0 0;0 0 0 0 1 0;0 0 0 0 0 1];
r = [.1 0;0 0.1];
[K,S,E] = lqr(Aaum,Baum,q,r);


print( 5,'-dpng', '-r300','c9_res00.png');
print(10,'-dpng', '-r300','c9_res02.png');
print(15,'-dpng', '-r300','c9_res03.png');
print(20,'-dpng', '-r300','c9_res04.png');
print(25,'-dpng', '-r300','c9_res05.png');
print(30,'-dpng', '-r300','c9_res06.png');
print(35,'-dpng', '-r300','c9_res07.png');