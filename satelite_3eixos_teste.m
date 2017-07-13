function xdot=satelite_3eixos(t,x)

p=x(1);
q=x(2);
r=x(3);

phi=x(4);
theta=x(5);
psi=x(6);

Iy=314.0648; %?????
a=0.25;
b=0.75;
n=1;


Ix=-(Iy-b*Iy)/(-1+a*b);
Iz=-(Iy-a*Iy)/(-1+a*b);

Cx=0.1;

Cy=0.1;
Cz=0.1;

Qx=3*(-Iz+Iz)*n^2*cos(theta)^2*cos(phi)*sin(phi)+(Iy-Iz)*n^2*Cx;
Qy=3*(-Ix+Iz)*n^2*cos(theta)*cos(phi)*sin(theta)+(Ix-Iz)*n^2*Cy;
Qz=3*(Ix-Iy)*n^2*cos(theta)*sin(theta)*sin(phi)+(Iz-Ix)*n^2*Cz;

xdot=[(Qx+(Iy-Iz)*q*r)/Ix;
      (Qy+(-Ix+Iz)*p*r)/Iy;
      (Qz+(Ix-Iy)*p*q)/Iz;
       p + n*sec(theta)*sin(psi)+(r*cos(phi)+q*sin(phi))*tan(theta);
       n*cos(psi)+q*cos(phi)-r*sin(phi);
       sec(theta)*(r*cos(phi)+q*sin(phi))+n*sin(psi)*tan(theta)];

% xdot=[-0.25*(Cx+q*r-3*cos(theta)^2*cos(phi)*sin(phi));
%       0.210526*(-4*Cy+4*p*r+6*cos(phi)*sin(2*theta));
%       0.75*(Cz-p*q-3*cos(theta)*sin(theta)*sin(phi));
%       p+sec(theta)*sin(psi)+(cos(phi)*r+q*sin(phi))*tan(theta);
%       cos(psi)+cos(phi)*q-r*sin(phi);
%       sec(theta)*(cos(phi)*r+q*sin(phi))+sin(psi)*tan(theta)];

return
