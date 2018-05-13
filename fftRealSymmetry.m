function [B] = fftRealSymmetry(A,N)
%fftRealSymmetry Summary of this function goes here
%   Detailed explanation goes here
B = A;
[row, col] = size(A);
if(row ~= col)
    return;
end


A1 = A(:,1:N-1);

A_mid = A(:,N);
mid = floor(col/2);
A_mid1 = A_mid(1:mid-1);
A_mid2 = A_mid((mid+1):end);
A_mid2 = flipud(A_mid2);

for i = 1:length(A_mid1)
    rel1 = real(A_mid1(i));
    im1 = imag(A_mid1(i));
    rel2 = real(A_mid2(i));
    im2 = imag(A_mid2(i));
    
    realComponent = (rel1 + rel2)/2;
    imaginaryComponent = (abs(im1) + abs(im2))/2;
    
    if(im1 < 0)
        A_mid1(i) = complex(realComponent,-imaginaryComponent);
        A_mid2(i) = complex(realComponent, imaginaryComponent);
    else
        A_mid1(i) = complex(realComponent,imaginaryComponent);
        A_mid2(i) = complex(realComponent, -imaginaryComponent);
    end
end

A_mid2 = flipud(A_mid2);
A_mid = [A_mid1; A_mid(length(A_mid1)+1); A_mid2(end:-1:1)];

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

B = [rot90(A2,2) A_mid A1];

end

