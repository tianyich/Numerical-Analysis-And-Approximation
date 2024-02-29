function x2 = secantMethod(x0,x1,M,e,d)
v = sin(x1/2)-1;
if abs(v)<e
    return;
end
for k = 1:M
    u = (v - (sin(x0/2)-1))/(x1-x0);
    x2 = x1 - v/u;
    v = sin(x2/2)-1;
    if abs(x2-x1)<d || abs(v)< e
        return
    end
    x0 = x1;
    x1 = x2;
   
end


end 