function x_1 = NewtonMethod(x_0,M,d,e)
v = x_0 - tan(x_0);
if abs(v)<e
    return;
end
for k = 1:M
    x_1 = x_0 - v/(1-sec(x_0)^2);
    v = x_1 - tan(x_1);
    if abs(x_1-x_0)<d || abs(v)< e
        return
    end
    x_0 = x_1;
end

end