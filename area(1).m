function [areatotal] = area(C1,r1,C2,r2)
d = norm(C1-C2);
if isequal(d,0)
  areatotal = pi*min(r1,r2)^2;
  return
end
x = 0.5*(d + (r1^2 - r2^2)/d);
if r1^2 < x^2 
  if r1 + r2 < d
    areatotal = 0;
  else
    areatotal = pi*min(r1,r2)^2;
  end
  return
end
y = sqrt(r1^2 - x^2);
theta1 =  2*asin(y/r1);
theta2 =  2*asin(y/r2);
areatotal = 0.5*((theta1*r1^2)+(theta2*r2^2))-y*(x+sqrt(r2^2-r1^2+x^2));
end