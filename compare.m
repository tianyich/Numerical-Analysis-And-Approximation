syms x
f(x) = atan(x) - 2*x/(1+x^2);

%Bisection method
BisectionCount = 1;
a = 0.5;
b = 3.5;
u = f(a);
v = f(b);
e = b-a;
while 1
    e = 0.5*e;
    c = a+e;
    w = f(c);
    if abs(w)<10^-5 || abs(e)<10^-5
        fprintf('Bisection Method approximate: %f with iteration count %d\n', c, BisectionCount);
        break;
    end
    if u*w>0
       a = c;
       u = w;
    else
       b = c;
       v = w;
    end
    BisectionCount = BisectionCount +1;
end

%Newton's method
NewtonCount = 1;
x0 = 3.5;
df = diff(f,x);
v = f(x0);
while 1
    x1 = x0-v/df(x0);
    v = f(x1);
    if abs(v)<10^-5 || abs(x1-x0)<10^-5
        fprintf('Newton Method approximate: %f with iteration count %d\n', x1, NewtonCount);
        break
    end
    x0 = x1;
    NewtonCount = NewtonCount +1;
end 

%Secant Method
SecantCount = 1;
x0 = 0.5;
x1 = 3.5;
v = f(x1);
while 1
    u = (f(x1)-f(x0))/(x1-x0);
    x2 = x1 - v/u;
    v = f(x2);
    if abs(x2-x1)<10^-5 || abs(v)< 10^-5

        fprintf('Secant Method approximate: %f with iteration count %d\n', x2, SecantCount);
        break
    end
    x0 = x1;
    x1 = x2;
    SecantCount = SecantCount +1;
end
   