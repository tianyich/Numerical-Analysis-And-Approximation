function B = B_Spline(x,k,i,t)
    if 1<= k
        V1 = (x-t(i))/(t(i+k)-t(i));
        V2 = (t(i+k+1)-x)/(t(i+k+1)-t(i+1));
        B = V1*B_Spline(x,k-1,i,t) + V2*B_Spline(x,k-1,i+1,t);
    else
        if (t(i)<=x && x<t(i+1))
            B = 1;
        else
            B = 0;
        end
    end
end