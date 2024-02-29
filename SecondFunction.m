function MyOutput = SecondFunction(A,B)
    m = size(A,1);
    n = size(A,2);
    q = size(B,1);
    p = size(B,2);
    MyOutput = zeros(m,p);
    
   if n == q
       for i = 1:m
            for j = 1:p
                for k = 1:n
                    MyOutput(i,j) = MyOutput(i,j) + A(i,k) * B(k,j);
                end
            end
       end

      
    else
        return
    end
    return

        
