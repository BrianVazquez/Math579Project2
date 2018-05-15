% Project 2 Test script
%% Test methods
% load('proj2compare.mat');
% load('proj2img.mat');
% 
% N1 = (length(t1) - 1)/2;
% N2 = (length(t2) - 1)/2;
% N3 = (length(t3) - 1)/2;
% N4 = (length(t4) - 1)/2;
% N5 = (length(t5) - 1)/2;
% 
% L1 = t1(end);
% L2 = t2(end);
% L3 = t3(end);
% L4 = t4(end);
% L5 = t5(end);
% 
% 
% % ---------- (x,y) grid ----------------------------------
% x1 = -L1:(pi/N1):L1;
% y1 = x1;
% x2 = -L2:(pi/N2):L2;
% y2 = x2;
% x3 = -L3:(pi/N3):L3;
% y3 = x3;
% x4 = -L4:(pi/N4):L4;
% y4 = x4;
% x5 = -L5:(pi/N5):L5;
% y5 = x5;

% --------- Direct Fourier Inversion -------------------------------
% f1_DFT = dirFourierInv(S1,theta1,t1);
% f2_DFT = dirFourierInv(S2,theta2,t2);
% f3_DFT = dirFourierInv(S3,theta3,t3);
% f4_DFT = dirFourierInv(S4,theta4,t4);
% f5_DFT = dirFourierInv(S5,theta5,t5);
% 
% % ------------ Back Projection (non-filtered) ---------------------
% f1 = backProj(S1,theta1,t1);
% f2 = backProj(S2,theta2,t2);
% f3 = backProj(S3,theta3,t3);
% f4 = backProj(S4,theta4,t4);
% f5 = backProj(S5,theta5,t5);


%---------- Filtered Back Projection --------------------------------- 
% f1_FB_RL = filteredBackProj(S1,theta1,t1,'Ram-Lak', N1*pi/L1);
% f2_FB_RL = filteredBackProj(S2,theta2,t2,'Ram-Lak', N2*pi/L2);
% f3_FB_RL = filteredBackProj(S3,theta3,t3,'Ram-Lak', N3*pi/L3);
% f4_FB_RL = filteredBackProj(S4,theta4,t4,'Ram-Lak', N4*pi/L4);
% f5_FB_RL = filteredBackProj(S5,theta5,t5,'Ram-Lak', N5*pi/L5);
% 
% f1_FB_H = filteredBackProj(S1,theta1,t1,'Hanning', N1*pi/L1);
% f2_FB_H = filteredBackProj(S2,theta2,t2,'Hanning', N2*pi/L2);
% f3_FB_H = filteredBackProj(S3,theta3,t3,'Hanning', N3*pi/L3);
% f4_FB_H = filteredBackProj(S4,theta4,t4,'Hanning', N4*pi/L4);
% f5_FB_H = filteredBackProj(S5,theta5,t5,'Hanning', N5*pi/L5);
% 
% f1_FB_SL = filteredBackProj(S1,theta1,t1,'Shepp-Logan', N1*pi/L1);
% f2_FB_SL = filteredBackProj(S2,theta2,t2,'Shepp-Logan', N2*pi/L2);
% f3_FB_SL = filteredBackProj(S3,theta3,t3,'Shepp-Logan', N3*pi/L3);
% f4_FB_SL = filteredBackProj(S4,theta4,t4,'Shepp-Logan', N4*pi/L4);
% f5_FB_SL = filteredBackProj(S5,theta5,t5,'Shepp-Logan', N5*pi/L5);


% ------ Plotting Data Sets ---------------------------------------
figure('Name','S1 Data Set', 'numberTitle','off')
subplot(2,2,1)
imagesc(x1,y1,flipud(f1));
subplot(2,2,2)
imagesc(x1,y1,flipud(f1_FB_RL));
subplot(2,2,3)
imagesc(x1,y1,flipud(f1_FB_H));
subplot(2,2,4)
imagesc(x1,y1,flipud(f1_FB_SL));
colormap('gray')

figure('Name','S2 Data Set', 'numberTitle','off')
subplot(2,2,1)
imagesc(x2,y2,flipud(f2));
subplot(2,2,2)
imagesc(x2,y2,flipud(f2_FB_RL));
subplot(2,2,3)
imagesc(x2,y2,flipud(f2_FB_H));
subplot(2,2,4)
imagesc(x2,y2,flipud(f2_FB_SL));
colormap('gray')

figure('Name','S3 Data Set', 'numberTitle','off')
subplot(2,2,1)
imagesc(x3,y3,flipud(f3));
subplot(2,2,2)
imagesc(x3,y3,flipud(f3_FB_RL));
subplot(2,2,3)
imagesc(x3,y3,flipud(f3_FB_H));
subplot(2,2,4)
imagesc(x3,y3,flipud(f3_FB_SL));
colormap('gray')

figure('Name','S4 Data Set', 'numberTitle','off')
subplot(2,2,1)
imagesc(x4,y4,flipud(f4));
subplot(2,2,2)
imagesc(x4,y4,flipud(f4_FB_RL));
subplot(2,2,3)
imagesc(x4,y4,flipud(f4_FB_H));
subplot(2,2,4)
imagesc(x4,y4,flipud(f4_FB_SL));
colormap('gray')

figure('Name','S5 Data Set', 'numberTitle','off')
subplot(2,2,1)
imagesc(x5,y5,flipud(f5));
subplot(2,2,2)
imagesc(x5,y5,flipud(f5_FB_RL));
subplot(2,2,3)
imagesc(x5,y5,flipud(f5_FB_H));
subplot(2,2,4)
imagesc(x5,y5,flipud(f5_FB_SL));
colormap('gray')

figure
imagesc(x1,y1,flipud(f1_DFT))
colormap('gray')
figure
imagesc(x2,y2,flipud(f1_DFT))
colormap('gray')
figure
imagesc(x3,y3,flipud(f1_DFT))
colormap('gray')
figure
imagesc(x4,y4,flipud(f1_DFT))
colormap('gray')
figure
imagesc(x5,y5,flipud(f1_DFT))
colormap('gray')
