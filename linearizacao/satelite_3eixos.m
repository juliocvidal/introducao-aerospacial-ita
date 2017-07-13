function xdot=satelite_3eixos(t,x)

p=x(1);
q=x(2);
r=x(3);

phi=x(4);
theta=x(5);
psi=x(6);

Cx=0.1;
Cy=0.1;
Cz=0.1;

xdot=[-0.25*(Cx+q*r-3*cos(theta)^2*cos(phi)*sin(phi));
      0.210526*(-4*Cy+4*p*r+6*cos(phi)*sin(2*theta));
      0.75*(Cz-p*q-3*cos(theta)*sin(theta)*sin(phi));
      p+sec(theta)*sin(psi)+(cos(phi)*r+q*sin(phi))*tan(theta);
      cos(psi)+cos(phi)*q-r*sin(phi);
      sec(theta)*(cos(phi)*r+q*sin(phi))+sin(psi)*tan(theta)];

return
