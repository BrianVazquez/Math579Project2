load('proj2ck.mat');

f1 = dirFourierInv(S1,theta1,t1);
N1 = (length(t1) - 1)/2;
x1 = -N1:1:N1;
y1 = x1;

imagesc(x1,y1,flipud(f1));
pbaspect([1,1,1]);
colormap('gray');

