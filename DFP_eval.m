F= @(x) 100*(x(1)^2-x(2))^2 +(1-x(1))^2;
g = @(x) [400*x(1)*(x(1)^2-x(2)) - 2*(1-x(1)) ; -200*(x(1)^2-x(2))];
x = [-1.2; 1.0];
[H,x0] = DFP(x,F,g);
disp(x0)
disp(H)