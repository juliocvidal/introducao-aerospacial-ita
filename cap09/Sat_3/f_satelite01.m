function[sys, x0] = f_satelite01(t,x,u,flag,o)
if abs(flag) == 3	
    controle = u(1:3);
     estados = u(4:9);
    
     Cx = controle(1);   Cy = controle(2);  Cz = controle(3);
      p = estados(1);     q = estados(2);    r = estados(3);  
    phi = estados(4); theta = estados(5);  psi = estados(6);
    
 sys(1) = -0.25*(Cx+q*r-3*cos(theta)^2*cos(phi)*sin(phi));
 sys(2) =  0.210526*(-4*Cy+4*p*r+6*cos(phi)*sin(2*theta));
 sys(3) =  0.75*(Cz-p*q-3*cos(theta)*sin(theta)*sin(phi));
 sys(4) =  p+sec(theta)*sin(psi)+(cos(phi)*r+q*sin(phi))*tan(theta);
 sys(5) =  cos(psi)+cos(phi)*q-r*sin(phi);
 sys(6) =  sec(theta)*(cos(phi)*r+q*sin(phi))+sin(psi)*tan(theta);
elseif flag == 0 	
    sys = [0 0 6 9 0 1];
    x0  = [];   
else
    sys = [];
end