function r = bisection_method(a,b,f,e)
    %check for initial interval
    if f(a) == 0
        r = a;
        return
    end
    if f(b) == 0
        r = b;
        return 
    end
    if f(a)*f(b) > 0
        disp("Bad initial interval")
        return
    end
    %repeat maximum 100 times
    for i = 1:100
        c = (a+b)/2;
        %stop condition
        if(abs(f(c))<e)
            r = c;
            return
        end
        if(f(c)*f(a)<0)
            b = c;
        end
        if(f(c)*f(b)<0)
            a = c;
        end
    end