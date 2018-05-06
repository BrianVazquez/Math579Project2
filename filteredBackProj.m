function [ f ] = filteredBackProj(S,theta,t,filter, B)
% filteredBackProj 

% Parameters:

% S: Two-dimensional array that stores the sinogram. Measurement angles
%    theta_j are on the horizontal axis, and the signed distance t between 
%    the x-ray and the origin varies along thevertical axis.

% theta: and Nx1 column vector that stores the angles along which the
%        measurements are performed.

% filter: one of the strings Ram-Lak, Hanning and Shepp-Logan that
%         indicates which filter is used.

% B: is a scalar that represents the cut-off bandwidth for the filters.

% Output: 

% f: two-dimensional array that stores the reconstructed attenuation
% coefficients over [-tmax:dt:tmax]x[-tmax:dt:tmax]
% -----------------------------------------------------------------------

%% Algorithm:

N = length(t);
f = zeros(size(S));

%Step 1: Calculating phi_hat(rj)


%Step 2: Filter step - Q_phi(f)(n*L/N,w_(theta))

%Step 3: back-projection step 

%Step 4: for (x_m,y_l) and theta_k, find n_klm in ZZ such that 
%        n_klm*L/N <= <(x_m,y_l),w(theta_k)> < (1 + n_klm)*L/N



end

