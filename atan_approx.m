
function [a,b] = atan_approx(h)
    x = sqrt(2);
    %phi(sqrt(2))
    a = (atan(x+h)-atan(x-h))/(2*h);
    %phi(sqrt(2)/2)
    k = (atan(x+h/2)-atan(x-h/2))/h;
    b = (4*k-a)/3;

end