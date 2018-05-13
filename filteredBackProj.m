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
T = length(t); 
N=(T-1)/2;
f = zeros(T,T);
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

%=============================Filter step=================================

%-----------------------------Get Rf_hat----------------------------------
Rf_hat=zeros(T-1,M);

for col=1:M
    Rfvec=S(1:T-1,col);
    for k=0:2*N-1
        sum = 0;
        for j= 0:T-2
            sum=sum+ Rfvec(j+1)*exp((-2i*pi*j*k)/(2*N));
        end
        Rf_hat(k+1,col)=sum/(2*N);
    end
end


% for i = 1:M
%     S(:,i) = fftshift(S(:,i));
% end
% Rf_hat = 2*L*fft(S);
% for i = 1:M
%     Rf_hat(:,i) = fftshift(Rf_hat(:,i));
% end
%----------------------------Get Qf matrix--------------------------------
RfQ=zeros(T-1,M);
for i = 1:M
    RfQ(:,i)= Rf_hat(:,i).*phiHatVec;
end

Qf=zeros(2*N,M);

for col = 1:M
    RfQ_vec=RfQ(:,col);
    for j= 0:2*N-1
        sum = 0;
        for k=0:2*N-1
            sum = sum + RfQ_vec(k+1)*exp(2i*j*k*pi/(2*N));
        end
        Qf(j+1,col)=2*L*sum;
    end
end
Qf=real(Qf);
%===========================Backprojection Step===========================
% for row = 1:2*N+1
%     for col= 1:2*N+1
%         sum=0;
%         xm=col-N-1; Xm=xm*L/N;
%         yl=row-N-1; Yl=yl*L/N;
%         tvec=[Xm,Yl];
%         for k=1:M
%             wvec=[cos(theta(k)),sin(theta(k))];
%             
%             n=ceil((-N-1+row)*cos(theta(k))) ;
%             
%             nk=dot(tvec,wvec)*N/L;
%             
%             beta=-n +nk;
%             
%             if n==N
%                 sum=sum + beta*Qf(2*N,k)+ (1-beta)*Qf(2*N-1,k);
%             elseif n==-N
%                 sum=sum + beta*Qf(2,k) + (1-beta)*Qf(1,k);
%             elseif n<N
%                 sum = sum + beta*Qf(n+N+1,k)+(1-beta)*Qf(n+N,k);
%             end
%             
%         end
%       
%         f(col,row)=sum/(2*M);
%     end
%     
% end

for m=-N:N
    for l=-N:N
        xVec=[m*L/N, l*L/N];
        
        sum = 0;
        
        for k=0:M-1
            wVec=[cos(theta(k+1)),sin(theta(k+1))];
            tvalue=dot(xVec,wVec);
            
            n=ceil(tvalue*(N/L)-1);
            
            beta = -n +tvalue*N/L;
            if n >= N
                sum = sum + beta*Qf(2*N,k+1) + (1-beta)*Qf(2*N-1,k+1);
            elseif n<= - N
                sum = sum + beta*Qf(2,k+1) + (1-beta)*Qf(1,k+1);
            elseif abs(n)<N
                sum = sum + beta*Qf(n+N+1,k+1) + (1-beta)*Qf(n+N,k+1);
            end
        end
        f(l+N+1,m+N+1)=sum/(2*M);
    end
end

end