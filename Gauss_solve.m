function x = Gauss_solve(A,b)
    n = size(A,1);
    %L = eye(n);
    for i=1:n
        %find the row with largest enrty 
        m = max_entry(A,i);
        if(m~=i)
            %swap with ith row
            A = swap(A,i,m);
            %do the same to b
            b([m,i]) = b([i,m]);
        end
        for j = i+1:n
            d = A(j,i)/A(i,i);
            %Rj -> Rj-k*Ri
            for k = i: n
                A(j,k) = A(j,k) - d*A(i,k);
            end
            %do the same for b
            b(j) = b(j) - d*b(i);
        end
    end
    x = uppertriangsolve(A,b);
end