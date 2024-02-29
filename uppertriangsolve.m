function x = uppertriangsolve(U,b)
    N = size(U);
    x = b;
    for i = N(1):-1:1
        for j = i+1:N(1)
            x(i) = x(i) - U(i,j)*x(j);
        end
        x(i) = x(i)/U(i,i);
    end
end