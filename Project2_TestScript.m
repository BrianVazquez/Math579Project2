% Project 2 Test script
% load('proj2img.mat');
%% Test methods
% load('proj2compare.mat');
% load('proj2ck.mat');
load('proj2img.mat');

% imagesc(flipud(A));
% colormap('gray');
% f11 = dirFourierInv(S1,theta1,t1);
% f12 = dirFourierInv(S2,theta2,t2);
% f13 = dirFourierInv(S3,theta3,t3);
% f14 = dirFourierInv(S4,theta4,t4);
% f15 = dirFourierInv(S5,theta5,t5);
% N1 = (length(t1) - 1)/2;
% N2 = (length(t2) - 1)/2;
% N3 = (length(t3) - 1)/2;
% N4 = (length(t4) - 1)/2;
% N5 = (length(t5) - 1)/2;

% fb11 = filteredBackProj(S1,theta1,t1,'Ram-Lak',120*pi);
% [fFBP1_h] = filteredBackProj(S1,theta1,t1,'Hanning',120*pi);
% [fFBP1_s] = filteredBackProj(S1,theta1,t1,'Shepp-Logan',120*pi);
% 
% x1 = -N1:1:N1;
% y1 = x1;
% x2 = -N2:1:N2;
% y2 = x2;
% x3 = -N3:1:N3;
% y3 = x3;
% x4 = -N4:1:N4;
% y4 = x4;
% x5 = -N5:1:N5;
% y5 = x5;


% subplot(2,2,1)
% imagesc(flipud(A));
% pbaspect([1,1,1]);

figure
subplot(1,2,1)
imagesc(x1,y1,flipud(f11));
pbaspect([1,1,1]);

subplot(1,2,2)
imagesc(x2,y2,flipud(f12));
pbaspect([1,1,1]);
colormap('gray');

figure
subplot(1,2,1)
imagesc(x3,y3,flipud(f13));
pbaspect([1,1,1]);

subplot(1,2,2)
imagesc(x4,y4,flipud(f14));
pbaspect([1,1,1]);
colormap('gray');

figure
imagesc(x5,y5,flipud(f15));
pbaspect([1,1,1]);
colormap('gray');
