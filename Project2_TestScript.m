% Project 2 Test script
% load('proj2img.mat');
%% Test methods
load('proj2compare.mat');
load('proj2ck.mat');



% imagesc(flipud(A));
% colormap('gray');
f11 = dirFourierInv(S1,theta1,t1);
f12 = backProj(S1,theta1,t1);

% fbp22 = filteredBackProj(S1,theta1,t1,'Ram-Lak',120*pi);
% [fFBP1_h] = filteredBackProj(S1,theta1,t1,'Hanning',120*pi);
% [fFBP1_s] = filteredBackProj(S1,theta1,t1,'Shepp-Logan',120*pi);

figure
subplot(1,2,1)
imagesc(fliplr(f11));
colormap('gray');

subplot(1,2,2)
imagesc(fliplr(f12));
colormap('gray');