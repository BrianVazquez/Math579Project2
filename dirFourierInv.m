function [ f ] = dirFourierInv(S,theta, t)
% dirFourierInv 

% Parameters:

% S: Two-dimensional array that stores the sinogram. Measurement angles
%    theta_j are on the horizontal axis, and the signed distance t between 
%    the x-ray and the origin varies along the vertical axis.

% theta: and Nx1 column vector that stores the angles along which the
%        measurements are performed.

% t: an Mx1 colum vectorthat stores the evenly spaced signed distances of
%    the lines that measurements are perfomred. t = [-tmax:dt:tmax]

% Output: 

% f: two-dimensional array that stores the reconstructed attenuation
% coefficients over [-tmax:dt:tmax]x[-tmax:dt:tmax]

%% Algorithm:

N = (length(t) - 1)/2;
L = t(end);
t = t(1:end-1);
S = S(1:end-1,:);
[length_t, theta_k] = size(S);
% Rf_hat = zeros(length_t-1,theta_k); % D.F.T of Rf/S
n = (pi/L)*(-N:1:N-1);
% for k = 1:theta_k
%     for rn = 1:length(n)
%         % Fix theta_k  for supp(Rf(t,w(theta))) subset of [-L,L]
%         exponent = (-n(rn)*pi/L)*t;
%         temp_S = S(:,k).*complex(cos(exponent),sin(exponent));
%         Rf_hat(rn,k) = (L/N)*sum(temp_S);
%     end
% end
for i = 1:theta_k
    S(:,i) = fftshift(S(:,i));
end
Rf_hat = 2*L*fft(S);
for i = 1:theta_k
    Rf_hat(:,i) = fftshift(Rf_hat(:,i));
end
r_n = (pi/L).*(-N:1:N-1);
[theta_kk, Rn] = meshgrid(theta,r_n);
[xi,eta] = pol2cart(theta_kk, Rn);

[x,y] = meshgrid(n,n);

interpRf_hat = griddata(xi,eta, Rf_hat, x,y);

% Apply symmetry
interpRf_hat(isnan(interpRf_hat)) = 0;
interpRf_hat = fftRealSymmetry(interpRf_hat,N);

for i = 1:2*N
    interpRf_hat(:,i) = ifftshift(interpRf_hat(:,i));
end

test_f = (1/(4*L^2))*ifft2(interpRf_hat,'symmetric');

for i = 1:2*N
    test_f(:,i) = ifftshift(test_f(:,i));
end

f = test_f;

end

