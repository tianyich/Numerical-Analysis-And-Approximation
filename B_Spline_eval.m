t = linspace(0,2.25,10);
c = [1,0.4142,1.3178,0.6822,1.5539,0.8956,1.7502];
x = linspace(0,2.25,50);
n=size(c,2);
S = zeros(size(x));
for i = 1:50
    result = 0;
    for j = 1:n
        result = result + c(j)*B_Spline(x(i),2,j,t);
    end
    S(i) = result; 
end

plot(x,S)
S