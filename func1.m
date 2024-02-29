function flop = func1(A,B,x)
    flop = 0;
    n = size(A);
    product = zeros(n);
    for i = 1 : n
        for j = 1 : n
            sum = 0;
            for k = 1 : n
                sum = sum + A(i, k) * B(k, j);
                %one add and one multiply adds 2 to flop
                flop = flop + 2;
            end
        product(i,j) = sum;
        end
    end

    result = zeros([n,1]);
    for i = 1:n
        sum = 0;
        for j = 1:n
            sum = sum + product(i,j)*x(j);
            flop = flop + 2;
        end
        result(i) = sum;
    end
end