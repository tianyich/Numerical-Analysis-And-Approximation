function x0 = NewtonMethodSystem(x0,M,e,d)
syms x y
f1(x,y) = 4*y^2+4*y + 52*x -19;
f2(x,y) = 169*x^2+3*y^2+111*x-10*y-10;
F = [f1(x0(1),x0(2)); f2(x0(1),x0(2))];
f1_dx(x,y) = diff(f1,x);
f1_dy(x,y) = diff(f1,y);
f2_dx(x,y) = diff(f2,x);
f2_dy(x,y) = diff(f2,y);
for k=1:M
    J = [f1_dx(x0(1),x0(2)), f1_dy(x0(1),x0(2));f2_dx(x0(1),x0(2)),f2_dy(x0(1),x0(2))];
    h = -J\F;
    x0 = x0 + h;
    F = [f1(x0(1),x0(2)); f2(x0(1),x0(2))];
    if norm(F,2)<e || norm(h,2) < d
        return
    end
end
end