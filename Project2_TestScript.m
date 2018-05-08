% Project 2 Test script
% load('proj2img.mat');
%% Test methods
load('proj2compare.mat');
load('proj2ck.mat');



% imagesc(flipud(A));
% colormap('gray');
f11 = dirFourierInv(S1,theta1,t1);

% fbp22 = filteredBackProj(S1,theta1,t1,'Ram-Lak',120*pi);
% [fFBP1_h] = filteredBackProj(S1,theta1,t1,'Hanning',120*pi);
% [fFBP1_s] = filteredBackProj(S1,theta1,t1,'Shepp-Logan',120*pi);


imagesc(flipud(f11));
colormap('gray');
% 
% figure
% imagesc(flipud(fFBP1_Hann));
% colormap('gray');