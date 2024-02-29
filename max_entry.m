function index = max_entry(A,i)
    index = i;
    N = size(A,1);
    max = A(1,i);
    for j = i:N
        if A(j,i) > max
            max = A(j,i);
            index = j;
        end
    end
end