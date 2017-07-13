function xdot=nonlinear_satelite(t,x)

omega=1;
d=1;
cktr1=0;
cktr2=1;

k=omega^2*d^3;

xdot=[ x(2);
     -(k/x(1)^2)+cktr1+x(1)*x(4)^2;
       x(4);
      (cktr2/x(1)^2)-(2*x(1)*x(2)*x(4)/x(1)^2)];

return
