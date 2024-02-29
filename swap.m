function B = swap(A,i,j)
    N = size(A,1);
    I = eye(N);
    %set up the permutation matrix
    I(i,i) = 0;
    I(j,j) = 0;
    I(j,i) = 1;
    I(i,j) = 1;
    B = I*A;
end