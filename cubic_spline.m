function z = cubic_spline(t,y)
    m = size(t,2);
    b = zeros(size(t));
    h = zeros(size(t));
    for i= 1:m-1
        h(i) = t(i+1)-t(i);
        b(i) = 6*(y(i+1)-y(i))/h(i);
    end
    u = zeros(size(t));
    v = zeros(size(t));
    u(2) = 2*(h(1)+h(2));
    v(2) = b(2)-b(1);
    for i=3:m-1
        u(i) = 2*(h(i)+h(i-1)) - h(i-1)^2/u(i-1);
        v(i) = b(i) - b(i-1) - (h(i-1)*v(i-1))/u(i-1);
    end
    z = zeros(size(t));
    z(m) = 0;
    z(1) = 0;
    for i=m-1:-1:2
        z(i) = (v(i) - h(i)*z(i+1))/u(i);
    end
end