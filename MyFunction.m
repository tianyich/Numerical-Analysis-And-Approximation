function MyOutput = MyFunction(A,x)
    m = size(A,1);
    n = size(A,2);
    MyOutput = zeros(m,1);
    
   if n == size(x,1)
       if size(x,2) == 1
            for i = 1:m
                for j = 1:n
                    MyOutput(i,1) = MyOutput(i,1) + A(i,j) * x(j);
                end
            end

       end
    else
        return
    end
    return

        
