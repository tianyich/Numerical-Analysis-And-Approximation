function d = Newton_table(x,y)
    n = size(x,1);
    d = zeros(n,n+1);
    %assign first two col with x and y
    d(:,1) = x;
    d(:,2) = y;
    for i = 3:n+1
        for j = 1:n+2-i
            %calculate f[x..]
            d(j,i) = (d(j+1,i-1)-d(j,i-1))/(d(j+i-2,1)-d(j,1));
        end
    end
    %extract first row and discard first col(x values)
    d = d(1,2:end);
end