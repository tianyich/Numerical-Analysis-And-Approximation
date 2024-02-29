t = linspace(0,2.25,10);
y = sqrt(t);
m = 10;
h = 0.25;
b = zeros(size(t));
for i= 1:m-1
    b(i) = 6*(y(i+1)-y(i))/h;
end
u = zeros(size(t));
v = zeros(size(t));
u(2) = 4*h;
v(2) = b(2)-b(1);
for i=3:m-1
    u(i) = 4*h - h^2/u(i-1);
    v(i) = b(i) - b(i-1) - (h*v(i-1))/u(i-1);
end
z = zeros(size(t));
z(m) = 0;
z(1) = 0;
for i=m-1:-1:2
    z(i) = (v(i) - h*z(i+1))/u(i);
end

x = linspace(0,2.25,50);
s = zeros(size(x));
for j=1:50
    i = 1;
    %determine Si(x)
    for k=1:m-1
        if x(j) >= t(k) && x(j) <= t(k+1)
            break
        end
        i = i+1;
    end
    c = y(i+1)/h-z(i+1)*h/6;
    d = y(i)/h - z(i)*h/6;
    s(j) = z(i)/(6*h)*(t(i+1)-x(j))^3 + z(i+1)/(6*h)*(x(j)-t(i))^3 + c*(x(j)-t(i)) + d*(t(i+1)-x(j));
end

hold on
plot(t,y,'o')
plot(x,s)



