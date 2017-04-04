function [yq] = CustomGriddedInterpolant(x,y,xq)
%Test of custom GriddedInterpolant

n=length(xq);
m=length(x);
yq = zeros(size(xq));

boundNumber = 100; %define bound size

%find the lowest x value and then define bound size
lowbounds=min(x);
boundSize=(max(x)-lowbounds)./boundNumber;

%setup the vector for the bounds and set the first bound to the lowest x value
b=zeros(size(boundNumber));
b(1)=lowbounds
for j=2:boundNumber
    b(j)=(j-1).*boundSize+lowbounds
end
jstart=1

%ask: if xq is between bounds. If not search next bounds. If is continue
%loop from j value that fulfilled the inequalities.
for i=1:n; %counting along the sample xqs
        if xq(i) > b(j) && xq(i)<b(j+1)
           jstart=j; 
           for k=j*10:sze*
               if xq(i) > x(k) && xq(i)<x(k+1)
                   proportion = (xq(i)- x(j)) / (x(j+1)-x(j));
                   yq(i) = y(j)+ proportion*(y(j+1)-y(j));
               end
           end
        end
    end
end

