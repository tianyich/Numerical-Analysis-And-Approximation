function x = goldenSection(a,b,f)
    e = 10^-5;
    M = 100;
    r = 0.5*(sqrt(5)-1);
    x = a + r*(b-a);
    y = a + r^2*(b-a);
    u = f(x);
    v = f(y);
    for i = 1:M
        if v<u
            b = x;
            x = y;
            u = v;
            y = a + r^2*(b-a);
            v = f(y);
        else
            a = y;
            y = x;
            v = u;
            x = a + r*(b-a);
            u = f(x);
        end
        if abs(a-b) < e
            break
        end 
    end
end