function [y, dy] = quartic(x)
%QUARTIC Powell's quartic function.
%   Returns value function and gradient vector.
y = (x(:,1) + 10*x(:,2)).^2 + 5*(x(:,3) - x(:,4)).^2 + ...
    (x(:,2) - 2*x(:,3)).^4 + 10*(x(:,1) - x(:,4)).^4;
dy = [2*(x(:,1) + 10*x(:,2)) + 40*(x(:,1) - x(:,4))^3;
    20*(x(:,1) + 10*x(:,2)) + 4*(x(:,2) - 2*x(:,3))^3;
    10*(x(:,3) - x(:,4)) - 8*(x(:,2) - 2*x(:,3))^3;
    -10*(x(:,3) - x(:,4)) - 40*(x(:,1) - x(:,4))^3];
end