clear all
clc

% get EXPIRATION data on CO2/O2 amount vs cumulative volume
% this array has 10ms incremental data points/indices
%but here make dummy variables
x = zeros(1000);
x(1) = 1;
for ij=2:1000, %expiration volumes
    x(ij) = x(ij-1)+rand;
end

y = zeros(size(x));
y(1) = 1;
for ix=2:length(x),
    y(ix) = y(ix-1)+rand;
end


% with INSPIRATION we want to infer the amount of CO2 and O2 in each 10ms
% cumulative volume bin by interpolating from the EXPIRATION data.
%xq = the cumulative volume at each 10ms during INSPIRATION.
xq=zeros(400);
xq(1) = 1;
for ik=2:980,
    xq(ik) = xq(ik-1)+rand; 
end

tic
yyq=TestGriddedInterpolant(x,y,xq);
toc
elapsedTime.griddedInterpolant=toc
% Plot the gridded interpolation results
plot(x,y,':.',xq,yyq,'o')
legend('sample data','Gridded interpolation')


tic
yq=RobbinsTest3(x,y,xq);
toc
elapsedTime.snapper=toc
%plot
plot(x,y,':.',xq,yq,'o')
legend('sample data','Snapper Test')

tic
yq=CustomGriddedInterpolant(x,y,xq);
toc
elapsedTime.CustomGriddedInterpolant=toc
%plot
plot(x,y,':.',xq,yq,'o')
legend('sample data','Inspiration data')

Efficiency = elapsedTime.griddedInterpolant./elapsedTime.snapper




