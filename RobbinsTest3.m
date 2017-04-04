function [yq] = RobbinsTest3(x,y,xq)
%Test of looping interpolation

n=length(xq);
m=length(x);

yq = zeros(size(xq));

%ask: if xq > x1 (x at first index) then search in next highest
%if xq < x2 then you know xq bounded by x1 and x2.
%then do proportion=(x2 - xq)/(x2 - x1) to get proportion through bound
%to find amount of CO2/O2 at xq do (1-proportion)*y2
%Inspired==i & Expired==j
jstart=1;
for i=1:n %looping across expired known values
    for j=jstart:m-1;
        if xq(i) > x(j) && xq(i)<x(j+1)
            proportion = (xq(i)- x(j)) / (x(j+1)-x(j));
            yq(i) = y(j)+ proportion*(y(j+1)-y(j));
            jstart=j;
            %continue from j value that fulfilled the inequalities
        end
    end
end
end

