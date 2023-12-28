function [y, dy] = quadratic(x)
%QUADRATIC Summary of this function goes here
%   Detailed explanation goes here
y = x(:,1) - x(:,2) + 2*x(:,1).^2 + 2*x(:,1).*x(:,2) +x(:,2).^2;
dy = [1 + 4*x(:,1) + 2*x(:,2), -1 + 2*x(:,1) + 2*x(:,2)];
end