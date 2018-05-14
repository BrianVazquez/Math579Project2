function [value] = SL_sinc(r)
if r==0
    value=1;
else
    value=(sin(r))/r;
end
end