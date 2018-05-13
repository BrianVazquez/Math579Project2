load('proj2ck.mat');

% f1 = dirFourierInv(S1,theta1,t1);
% N1 = (length(t1) - 1)/2;
% x1 = -N1:1:N1;
% y1 = x1;
% 
% imagesc(x1,y1,flipud(f1));
% pbaspect([1,1,1]);
% colormap('gray');
N = (length(t1)-1)/2;
L = abs(t1(1));
B = N*pi/L;
Ram_Lak = filteredBackProj(S1,theta1,t1,'Ram-Lak',B);
Hanning = filteredBackProj(S1,theta1,t1,'Hanning',B);
% Shepp_Logan = filteredBackProj(S1,theta1,t1,'Shepp-Logan',120*pi);

figure
subplot(1,2,1)
imagesc(flipud(Ram_Lak));
colormap('gray');
pbaspect([1,1,1]);

subplot(1,2,2)
imagesc(flipud(fFBP1_RL));
colormap('gray');
pbaspect([1,1,1]);