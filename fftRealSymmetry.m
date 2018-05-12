function [B] = fftRealSymmetry(A,N)
%fftRealSymmetry Summary of this function goes here
%   Detailed explanation goes here
B = A;
[row, col] = size(A);
if(row ~= col)
    return;
end


A1 = A(:,1:N);
A2 = A(:,(N+1):end);
A2 = rot90(A2,2);

[r,c] = size(A1);

for i = 1:r
    for j = 1:c
        Q1 = A1(i,j);
        Q2 = A2(i,j);
        
        realQ1 = real(Q1);
        realQ2 = real(Q2);
        imagQ1 = imag(Q1);
        imagQ2 = imag(Q2);
        
        realPart = (realQ1 + realQ2)/2;
        imaginaryPart = (abs(imagQ1) + abs(imagQ2))/2;
        
        if(imagQ1 < 0)
            A1(i,j) = complex(realPart,-imaginaryPart);
            A2(i,j) = complex(realPart,imaginaryPart);
        else
            A1(i,j) = complex(realPart,imaginaryPart);
            A2(i,j) = complex(realPart,-imaginaryPart);
        end
        
    end
end

B = [rot90(A2,2) A1];


end

