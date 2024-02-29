function [fm,X,im] = Neld_Mead(f, x,a,b,c)
    e = 10^(-5);
    M = 500;
    l = size(x,2);
    F = zeros(l,1);
    X = zeros(size(x));
    for i = 1:l
        F(i) = f(x(:,i));
        X(:,i) = x(:,i);
    end
    %minimum f(x) and its index
    [fm,im] = min(F);
    %Two maximum f(x) and their indices
    [B,I] = maxk(F,2);
    f0 = B(1);
    f1 = B(2);
    i0 = I(1);
    i1 = I(2);
    k=0;
    while((f0-fm)/max(abs(f0)+abs(fm),1)) > e && k<M
        %Centroid
        u = mean(X(:,(1:l)~=i0),2);
        %Reflection
        v = (1+a)*u-a*X(:,i0);
        fv = f(v);
        %Check if reflection improves
        if fv< fm
            %Expansion
            w = (1+c)*v-c*u;
            fw = f(w);
            %Check if expansion improves
            if fw < fm
                %replace x0 with expansion
                X(:,i0) = w;
                f0 = fw;
                F(i0) = fw;
            else
                %replace x0 with reflection
                X(:,i0) = v;
                f0 = fv;
                F(i0) = fv;
            end 
        else
            %Check if reflection did worse
            if fv <= f1
                X(:,i0) = v;
                f0 = fv;
                F(i0) = fv;
            else
                B = f0;
                if fv<= f0
                    X(:,i0) = v;
                    f0 = fv;
                    F(i0) = fv;
                end
                %Reduction
                w = b*(X(:,i0)) + (1-b)*u;
                fw = f(w);
                %Check if reduction improves
                if fw <= B
                    %replace x0 with reduction
                    X(:,i0) = w;
                    f0 = fw;
                    F(i0) = fw;
                else
                    %Contraction
                    for i = 1:l
                        if i ~= im
                            X(:,i) = 1/2*(X(:,i)+X(:,im));
                            F(i) = f(X(:,i));
                        end
                    end
                end
            end
        end
        %Re-find minimum and two maximums
        [fm,im] = min(F);
        [B,I] = maxk(F,2);
        f0 = B(1);
        f1 = B(2);
        i0 = I(1);
        i1 = I(2);
        k = k+1;
    end
end 