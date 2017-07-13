function[sys, x0] = f_sat01(t,x,u,flag,omega,d)
if abs(flag) == 3	
    estados = u(1:4);
  controle = u(5:6);
 
     x1 = estados(1);     x2 = estados(2); 
     x3 = estados(3);     x4 = estados(4); 
  cktr1 = controle(1); cktr2 = controle(2);  k = omega^2*d^3;
  
  aux01 = -(k/x1^2)+cktr1+x1*x4^2;
  aux02 = (cktr2/x1^2)-(2*x1*x2*x4)/x1^2;
  
  sys(1) = x2; sys(2) = aux01;  sys(3) = x4; sys(4) = aux02;
elseif flag == 0 
    sys = [0 0 4 6 0 1];
    x0  = [];       
else
    sys = [];
end