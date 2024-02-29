function s = eval_spline(t,y,z,x)
    s = zeros(size(x));
    m = size(t,2);
    n = size(x,2);
    for j=1:n
        i = 1;
        %determine Si(x)
        for k=1:m-1
            if x(j) >= t(k) && x(j) <= t(k+1)
                break
            end
            i = i+1;
        end
        h = t(i+1)-t(i);
        c = y(i+1)/h-z(i+1)*h/6;
        d = y(i)/h - z(i)*h/6;
        s(j) = z(i)/(6*h)*(t(i+1)-x(j))^3  ...
            +z(i+1)/(6*h)*(x(j)-t(i))^3 ...
            + c*(x(j)-t(i)) + d*(t(i+1)-x(j));
    end
end