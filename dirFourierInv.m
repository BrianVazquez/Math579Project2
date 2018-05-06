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
[length_t, theta_k] = size(S);
% f = zeros(length_t);
Rf_hat = zeros(length_t,theta_k); % D.F.T of Rf/S

j = -N:1:N;
for n = -N:1:N
    % Fix theta_k  for supp(Rf(t,w(theta))) subset of [-L,L]
    for k = 1:theta_k
        temp_vec = (-pi*n.*(j*L/N))/N;
        temp_S = S(:,k).*complex(cos(temp_vec),sin(temp_vec))';
        Rf_hat(:,k) = (L/N)*sum(temp_S);
    end
end



f = Rf_hat;

end

