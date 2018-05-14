function [ f ] = filteredBackProj(S,theta,t,filter, B)
% filteredBackProj 

% Parameters:

% S: Two-dimensional array that stores the sinogram. Measurement angles
%    theta_j are on the horizontal axis, and the signed distance t between 
%    the x-ray and the origin varies along the vertical axis.

% theta: and Mx1 column vector that stores the angles along which the
%        measurements are performed.

%t : Nx1 column vector that sotres the EVENLY spaced signed distances of
%       the lines that measurements are performed t = [-tmax:dt:tmax]'

% filter: one of the strings Ram-Lak, Hanning and Shepp-Logan that
%         indicates which filter is used.

% B: is a scalar that represents the cut-off bandwidth for the filters.

% Output: 

% f: two-dimensional array that stores the reconstructed attenuation
% coefficients over [-tmax:dt:tmax]x[-tmax:dt:tmax]
% -----------------------------------------------------------------------

% Algorithm:
L=abs(t(1));
M= length(theta);
length_t = length(t); 
t1 = t(1:end-1);
N=(length_t-1)/2;
f = zeros(length_t,length_t);
S1 = S(1:end-1,:);
%-----Calculate phi_hat(r_j_ for j=-N,...,N-1 where r_j = j*pi/L---------

switch filter
    case 'Ram-Lak'
        A = @(r) apFun(r,B);
    case 'Hanning'
        A = @(r) (cos(pi*r/(2*B))^2).*apFun(r,B);
    case 'Shepp-Logan'
        A = @(r) abs(SL_sinc(r*L/(2*N))).^3;
    otherwise
        disp('invalid filter input.'); 
        return;
end

phiHat = @(r) A(r)*abs(r);
j = -N:1:N-1;
rj = j*pi/L;
rj_len = length(rj);
phiHatVec = zeros(rj_len,1);

for i = 1:rj_len
    phiHatVec(i) = phiHat(rj(i));
end

for i = 1:M
    S1(:,i) = fftshift(S1(:,i));
end

Rf_hat = 2*L*fft(S1);
for i = 1:M
    Rf_hat(:,i) = fftshift(Rf_hat(:,i));
end

%=============================Filter step============================
Rf_hat = Rf_hat.*phiHatVec;

temp_M = fftshift(Rf_hat);
F = 2*L*ifft(temp_M, 'symmetric');
F = ifftshift(F);

% --------------- Back Projection Step -------------------------------
f = backProj([F; F(1,:)],theta,t);

end