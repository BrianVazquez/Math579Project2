function [ value ] = apFun(r, B )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
value = 0;

if((-B <= r) && r <= B)
    value = r;
end

end

