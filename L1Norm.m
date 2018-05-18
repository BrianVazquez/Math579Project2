function [ num ] = L1Norm( f,dx,dy )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = sum(sum(abs(f)))*dx*dy;

end

