function [H,x1] = DFP(x0, F, g)
    M = 100;
    e = 10^-8;
    k = 0;
    H = eye(size(x0,1));
    x1 = x0;
    while norm(g(x1),2) > e && k <= M
        p = -H*g(x0);
        a = armijoLS(F,g,1,100,F(x0),g(x0),p,x0);
        s = a*p;
        x1 = x0 + s;
        y = g(x1)-g(x0);
        H = H+(s*s')/(y'*s) - (H*y*y'*H)/(y'*H*y);
        k = k+1;
        x0 = x1;
    end
end