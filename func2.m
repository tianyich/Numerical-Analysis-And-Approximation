function flop = func2(A,B,x)
    flop = 0;
    n = size(A);
    product = zeros([n,1]);
    
    for i = 1:n
        sum = 0;
        for j = 1:n
            sum = sum + B(i,j)*x(j);
            flop = flop + 2; 
        end
        product(i) = sum;
    end

    result = zeros([n,1]);
    for i = 1 : n
        sum = 0;
        for j = 1 : n
            sum = sum + A(i,j) * product(j);
            flop = flop + 2;
        end
        result(i) = sum;
    end
end