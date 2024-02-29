function y_eval = evaluate_Newton(x,y,x_eval)
    d = Newton_table(x,y)';
    n = size(x,1);
    y_eval = 0;
    for i = 1:n
        k = d(i,1);
        for j = 1:i-1
            % (x-x_i)
            k = k*(x_eval-x(j,1));
        end
        y_eval = y_eval + k;
    end
end