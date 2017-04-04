function [yyq] = TestGriddedInterpolant(x,y,xq)
%Test of the canned GriddedInterpolant

F = griddedInterpolant(x,y)
% Perform linear interpolation at query points xq
yyq = F(xq);

end

