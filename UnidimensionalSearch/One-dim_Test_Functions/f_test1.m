function [y,dy,ddy] = f_test1(x)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    y = 0.65 - 0.75/(1+x^2)-0.65*x*atan(1/x);
    dy = 1.5*x/(1+x^2)^2 + 0.65*x/(1+x^2) - 0.65*atan(1/x);
    ddy = (2.8 - 3.2*x^2)/(1 + x^2)^3;
end