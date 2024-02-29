function sum = mysum(r,n)
sum = 0;
for i = 0:n
    sum = sum + 1/(r^i);
end 
